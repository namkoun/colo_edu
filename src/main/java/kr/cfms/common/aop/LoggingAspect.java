package kr.cfms.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
@Component
public class LoggingAspect {	

	@Around("(execution(* kr.cfms..controller..*Controller.*(..))"
			+ " || execution(* kr.cfms..service..*Service.*(..))"
			+ " || execution(* kr.cfms..mapper..*Mapper.*(..)))"
			+ " && !@annotation(kr.cfms.common.annotation.NoLogging)")
	public Object logging(ProceedingJoinPoint pjp) throws Throwable {
		
		String type = "";
		String classNm = pjp.getSignature().getDeclaringTypeName();
		String methodNm = pjp.getSignature().getName();
		
		if (classNm.contains("Controller")) {
            type = " Controller - ";
        } else if (classNm.contains("Service")) {
            type = " Service - ";
        } else if (classNm.contains("Mapper")) {
        	type = " Mapper - ";
		} else {
			type = "Etc - ";
		}
		
		log.info("{}[START] : '{}.{}()'", type, classNm, methodNm);
		Object result = pjp.proceed();
		log.info("{}[END  ] : '{}.{}()'", type, classNm, methodNm);
		
		return result;
	}

}
