package kr.cfms.common.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.AsyncHandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component("pageTitleInterceptor")
public class PageTitleInterceptor implements AsyncHandlerInterceptor {

    private static final Map<String, String> PARENT_MAP = new HashMap<>();
    private static final Map<String, String> DEPTH1_MAP = new HashMap<>();

    static {
        PARENT_MAP.put("dashboard", "대시보드");
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView model) throws Exception {
        if (model != null) {
            String uri = request.getRequestURI();
            String[] uriArr = uri.split("/");
            StringBuilder sb = new StringBuilder();
            String parentUri = "";
            String depth1Uri = "";
            if (uriArr.length >= 2) {
                parentUri = uriArr[1];
                sb.append(PARENT_MAP.get(parentUri));
                if (uriArr.length >= 3) {
                    depth1Uri = uriArr[2];
                    sb.append(" > ");
                    sb.append(DEPTH1_MAP.get(depth1Uri));
                }
            }

            model.getModelMap().addAttribute("title", sb.toString());
            model.getModelMap().addAttribute("parent", parentUri);
            model.getModelMap().addAttribute("depth1", depth1Uri);
        }
    }
}
