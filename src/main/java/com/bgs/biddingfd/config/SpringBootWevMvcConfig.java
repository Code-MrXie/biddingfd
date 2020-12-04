//package com.bgs.biddingfd.config;
//
//import com.bgs.biddingfd.pojo.User;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//@Configuration
//public class SpringBootWevMvcConfig  implements WebMvcConfigurer {
//
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        MyHandlerInterceptor li=new MyHandlerInterceptor();
//        List<String> pathPatterns=new ArrayList<>();
//        List<String> excludePathPatterns=new ArrayList<>();
//        excludePathPatterns.add("/log**");
//                 //pathPatterns表示所有的信息需要拦截的请求，这里写了/**，全部拦截
//                 //excludePathPatterns表示不拦截的请求，这里除了用户退出和登录操作以外，其他的都需要由用户登录才可以操作
//        registry.addInterceptor(li).addPathPatterns(pathPatterns).excludePathPatterns(excludePathPatterns);
//
//    }
//    public class MyHandlerInterceptor implements HandlerInterceptor {
///*    public TestInterceptor(){
//
//    }*/
//
//        @Override
//        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
//            String queryString = request.getQueryString();
//            String requestURL = request.getRequestURL().toString();
//            System.out.println("拦截器1，如入参：" + queryString + "访问地址，" + requestURL);
//
//
//           User u= (User)request.getSession().getAttribute("UserLogin");
//            if(u==null) {
//            response.sendRedirect("/loginadd");
//            return false;
//            }else {
//            return true;
//        }
//        }
//        @Override
//        public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
//            System.out.println("拦截器2");
//        }
//
//        @Override
//        public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)  {
//            System.out.println("拦截器3");
//        }
//
//    }
//}
