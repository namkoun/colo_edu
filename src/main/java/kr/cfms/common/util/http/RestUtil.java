package kr.cfms.common.util.http;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.cfms.common.constant.enumeration.RestType;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
public class RestUtil {
	
    private static RestTemplate restTemplate;
    private static ObjectMapper objectMapper;

    
	@SuppressWarnings("static-access")
	public RestUtil(RestTemplate restTemplate, ObjectMapper objectMapper) {
		
		this.restTemplate = restTemplate;
		this.objectMapper = objectMapper;
		log.debug("============== restTemplate: [{}]", restTemplate);
	}
	
	private static RestTemplate getRestTemplate(RestType restType) {
		return restTemplate;
	}
	

	/**
	 * 세션ID 관련 임시로 사용
	 */
    public static ResponseEntity<String> rest(String url, HttpMethod method, Map<String, String> params) throws RestClientException {
        return rest(RestType.DEFAULT, url, method, params);
    }
    
    public static ResponseEntity<String> rest(RestType restType, String url, HttpMethod method, Map<String, String> params) throws RestClientException {
    	
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);        
        HttpEntity<Map<String, String>> httpEntity = new HttpEntity<>(headers);
        
        RestTemplate rt = getRestTemplate(restType);
        log.debug("restTemplate: [{}]", rt);

        return rt.exchange(url, method, httpEntity, String.class, params);
    }
    
    
    /**
     * GET 호출 </br>
     * ContentType : application/json
     *
     * @param <T>
     * @param url
     * @param token (Authorization Bearer JWT)
     * @param params
     * @param responseType
     * @return
     * @throws RestClientException
     * @throws Exception
     */
	public static <T> ResponseEntity<T> get(String url, String token, Map<String, String> params, Class<T> responseType) throws RestClientException, Exception {

		return get(RestType.DEFAULT, url, token, params, responseType);
	}
	
	public static <T> ResponseEntity<T> get(RestType restType, String url, String token, Map<String, String> params, Class<T> responseType) throws RestClientException, Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE);

		if (StringUtils.isNotBlank(token)) {
			headers.setBearerAuth(token);
		}
		
		RestTemplate rt = getRestTemplate(restType);
        log.debug("restTemplate: [{}]", rt);

		return rt.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), responseType, params);
	}

    
    /**
     * GET 호출 </br>
     * 헤더를 자유롭게 정의해서 보내고자 하는 경우 사용
     * 
     * @param <T>
     * @param url
     * @param headers
     * @param params
     * @param responseType (Class)
     * @return
     * @throws RestClientException
     * @throws Exception
     */
    public static <T> ResponseEntity<T> get(String url, HttpHeaders headers, Map<String, ?> params, Class<T> responseType) throws RestClientException {
    	return get(RestType.DEFAULT, url, headers, params, responseType);
	}
    
    public static <T> ResponseEntity<T> get(RestType restType, String url, HttpHeaders headers, Map<String, ?> params, Class<T> responseType) throws RestClientException {

    	RestTemplate rt = getRestTemplate(restType);
        log.debug("restTemplate: [{}]", rt);
    	
    	if (CollectionUtils.isEmpty(params)) {
    		return rt.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), responseType);
		} else {
			return rt.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), responseType, params);
		}
	}
    
    
    /**
     * GET 호출 </br>
     * 헤더를 자유롭게 정의해서 보내고자 하는 경우 사용
     * 
     * @param <T>
     * @param url
     * @param headers
     * @param params
     * @param responseType (ParameterizedTypeReference)
     * @return
     * @throws RestClientException
     */
    public static <T> ResponseEntity<T> get2(String url, HttpHeaders headers, Map<String, ?> params, ParameterizedTypeReference<T> responseType) throws RestClientException {

    	return get2(RestType.DEFAULT, url, headers, params, responseType);
	}
    
    public static <T> ResponseEntity<T> get2(RestType restType, String url, HttpHeaders headers, Map<String, ?> params, ParameterizedTypeReference<T> responseType) throws RestClientException {

    	RestTemplate rt = getRestTemplate(restType);
        log.debug("restTemplate: [{}]", rt);
        
    	if (CollectionUtils.isEmpty(params)) {
    		return rt.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), responseType);
		} else {
			return rt.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), responseType, params);
		}
	}

    
	/**
	 * POST 호출 </br>
     * ContentType : application/json 
	 * 
	 * @param <T>
	 * @param url
	 * @param token (Authorization Bearer JWT)
	 * @param params
	 * @param responseType
	 * @return
	 * @throws RestClientException
	 * @throws Exception
	 */
	public static <T1, T2> ResponseEntity<T2> post(String url, String token, T1 params, Class<T2> responseType) throws RestClientException, Exception {

		return post(RestType.DEFAULT, url, token, params, responseType);
	}
	
	public static <T1, T2> ResponseEntity<T2> post(RestType restType, String url, String token, T1 params, Class<T2> responseType) throws RestClientException, Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE);

		if(StringUtils.isNotBlank(token)) {
			headers.setBearerAuth(token);
		}
		
		RestTemplate rt = getRestTemplate(restType);
        log.debug("restTemplate: [{}]", rt);

		return rt.exchange(url, HttpMethod.POST, new HttpEntity<T1>(params, headers), responseType);
	}

	
    /**
     * POST 호출 </br>
	 * 헤더를 자유롭게 정의해서 보내고자 하는 경우 사용
	 * 
     * @param <T1>
     * @param <T2>
     * @param url
     * @param headers
     * @param params
     * @param responseType (Class)
     * @return
     * @throws RestClientException
     * @throws Exception
     */
	public static <T1, T2> ResponseEntity<T2> post(String url, HttpHeaders headers, T1 params, Class<T2> responseType) throws RestClientException {

		return post(RestType.DEFAULT, url, headers, params, responseType);
	}
	
	public static <T1, T2> ResponseEntity<T2> post(RestType restType, String url, HttpHeaders headers, T1 params, Class<T2> responseType) throws RestClientException {

		RestTemplate rt = getRestTemplate(restType);
        log.debug("restTemplate: [{}]", rt);
        
		return rt.exchange(url, HttpMethod.POST, new HttpEntity<T1>(params, headers), responseType);
	}
	
	
	/**
	 * POST 호출 </br>
	 * 헤더를 자유롭게 정의해서 보내고자 하는 경우 사용
	 * 
	 * @param <T1>
	 * @param <T2>
	 * @param url
	 * @param headers
	 * @param params
	 * @param responseType (ParameterizedTypeReference)
	 * @return
	 * @throws RestClientException
	 */
	public static <T1, T2> ResponseEntity<T2> post2(String url, HttpHeaders headers, T1 params, ParameterizedTypeReference<T2> responseType) throws RestClientException {
		return post2(RestType.DEFAULT, url, headers, params, responseType);
	}
	
	public static <T1, T2> ResponseEntity<T2> post2(RestType restType, String url, HttpHeaders headers, T1 params, ParameterizedTypeReference<T2> responseType) throws RestClientException {

		RestTemplate rt = getRestTemplate(restType);
        log.debug("restTemplate: [{}]", rt);
        
		return rt.exchange(url, HttpMethod.POST, new HttpEntity<T1>(params, headers), responseType);
	}

	
	/**
	 * POST 호출 </br>
	 * ContentType : application/x-www-form-urlencoded 
	 * 
	 * @param <T>
	 * @param url
	 * @param params
	 * @param responseType
	 * @return
	 * @throws RestClientException
	 * @throws Exception
	 */
	public static <T> ResponseEntity<T> postByForm(String url, Map<String, Object> params, Class<T> responseType) throws RestClientException, Exception {
		return postByForm(RestType.DEFAULT, url, params, responseType);
	}
	
	public static <T> ResponseEntity<T> postByForm(RestType restType, String url, Map<String, Object> params, Class<T> responseType) throws RestClientException, Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		MultiValueMap<String, Object> multiValueMap = new LinkedMultiValueMap<String, Object>();
		multiValueMap.setAll(params);

		RestTemplate rt = getRestTemplate(restType);
        log.debug("restTemplate: [{}]", rt);
        
		return rt.exchange(url, HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(multiValueMap, headers), responseType);
	}

	/**
	 * POST 호출 </br>
	 * ContentType : application/x-www-form-urlencoded </br>
	 * Cookie 값을 보내는 경우 사용 
	 * 
	 * @param <T>
	 * @param url
	 * @param cookies
	 * @param params
	 * @param responseType
	 * @return
	 * @throws RestClientException
	 * @throws Exception
	 */
	public static <T> ResponseEntity<T> postByForm(String url, String cookies, Map<String, Object> params, Class<T> responseType) throws RestClientException, Exception {
		return postByForm(RestType.DEFAULT, url, cookies, params, responseType);
	}
	
	public static <T> ResponseEntity<T> postByForm(RestType restType, String url, String cookies, Map<String, Object> params, Class<T> responseType) throws RestClientException, Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.set(HttpHeaders.COOKIE, cookies);
		
		MultiValueMap<String, Object> multiValueMap = new LinkedMultiValueMap<String, Object>();
		multiValueMap.setAll(params);

		RestTemplate rt = getRestTemplate(restType);
        log.debug("restTemplate: [{}]", rt);
        
		return rt.exchange(url, HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(multiValueMap, headers), responseType);
	}
	

	/**
	 * 응답코드 체크 
	 * 
	 * @param <T>
	 * @param name
	 * @param response
	 * @param checkCode (확인하고 싶은 코드값)
	 * @throws Exception
	 */
	public static <T> void responseCheck(String name, ResponseEntity<T> response, int checkCode) throws Exception {
		log.debug("=========> RestUtil : responseCheck Start !!");
		
		if(response == null) {
			log.error("=========> Response Check : {} : response is null !!", name);
        	throw new Exception("response is null");
		}

        if(response.getStatusCodeValue() != checkCode) {
            log.error("=========> Response Check : {} : httpStatus error code : [{}]", name, response.getStatusCodeValue());
            throw new Exception("httpStatusCd : [" + response.getStatusCodeValue() + "]");
		}
		
		//LogPrinter.log(LogPrinter.INFO, "Response Check", "interfaceId : " + interfaceId, "httpStatusCd : [" + response.getStatusCodeValue() + "]");
        log.debug("=========> RestUtil : responseCheck End !!");
	}
	
	
	/**
	 * 헤더 출력 
	 */
	public static void headerPrinter(HttpHeaders httpHeaders) {

		for (Map.Entry<String, List<String>> entry : httpHeaders.entrySet()) {
			String headerName = entry.getKey();
			for (String headerValue : entry.getValue()) {
				log.info("=========> headerPrinter : headerName=[{}], headerValue=[{}]", headerName, headerValue);
			}
		}		
	}
	
	
	/**
	 * object to json string
	 */
	public static String getJsonStr(Object object) {

		String jsonString = null;

		try {
			jsonString = objectMapper.writeValueAsString(object);
		} catch (Exception e) {
			log.error("=========> RestUtil : getJsonStr method error!! ", e);
		}
		
		return jsonString;
	}

}