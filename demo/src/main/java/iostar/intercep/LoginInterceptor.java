package iostar.intercep;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication == null || !authentication.isAuthenticated()) {
            response.sendRedirect("/login");
            return false;
        }

        Object principal = authentication.getPrincipal();

        if (principal instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) principal;
            String role = userDetails.getAuthorities().iterator().next().getAuthority();

            String uri = request.getRequestURI();
            if (uri.startsWith("/admin") && !role.equals("ROLE_ADMIN")) {
                response.sendRedirect("/access-denied");
                return false;
            }
            if (uri.startsWith("/staff") && !role.equals("ROLE_STAFF")) {
                response.sendRedirect("/access-denied");
                return false;
            }
        }

        return true;
    }
}
