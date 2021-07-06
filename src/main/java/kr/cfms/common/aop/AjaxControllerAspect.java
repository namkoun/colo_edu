package kr.cfms.common.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;


@Slf4j
@Aspect
@Component
public class AjaxControllerAspect {

    @Pointcut("execution(@org.springframework.web.bind.annotation.PostMapping * kr.cfms.*.controller.ajax.*.*.*(..))")
    public void annotatedWithPost() {
    }

    @Pointcut("execution(@org.springframework.web.bind.annotation.PutMapping * kr.cfms.*.controller.ajax.*.*.*(..))")
    public void annotatedWithPut() {
    }

    @Pointcut("execution(@org.springframework.web.bind.annotation.DeleteMapping * kr.cfms.*.controller.ajax.*.*.*(..))")
    public void annotatedWithDelete() {
    }

    @Before("annotatedWithPost() || annotatedWithPut() || annotatedWithDelete()")
    public void handleBindingResultHasErrors(JoinPoint joinPoint) throws BindException {
        Object[] args = joinPoint.getArgs();
        BindingResult bindingResult = null;
        for (Object arg : args) {
            if (arg instanceof BindingResult) {
                bindingResult = (BindingResult) arg;
                break;
            }
        }
        if (bindingResult != null && bindingResult.hasErrors()) {
            throw new BindException(bindingResult);
        }
    }
}
