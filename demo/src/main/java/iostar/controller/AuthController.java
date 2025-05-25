//package iostar.controller;
//
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.AnonymousAuthenticationToken;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import iostar.entity.User;
//import iostar.service.UserService;
//
//@Controller
//@RequestMapping("/auth")
//public class AuthController {
//
//    @Autowired
//    private AuthenticationManager authenticationManager;
//
//    @Autowired
//    private UserService userService;
//
//    @GetMapping("/login")
//    public String showLoginForm(
//        @RequestParam(required = false) String error,
//        @RequestParam(required = false) String logout,
//        Model model,
//        Authentication authentication
//    ) {
//        if (authentication != null &&
//            authentication.isAuthenticated() &&
//            !(authentication instanceof AnonymousAuthenticationToken)) {
//            return "redirect:/auth/redirect-by-role";
//        }
//
//        if (error != null) model.addAttribute("error", "Đăng nhập thất bại");
//        if (logout != null) model.addAttribute("message", "Đăng xuất thành công");
//
//        return "auth/login";
//    }
//
//
//    @PostMapping("/process-login")
//    public String processLogin(@RequestParam("username") String username,
//                               @RequestParam("password") String password,
//                               HttpSession session,
//                               Model model) {
//        try {
//            Authentication authentication = authenticationManager.authenticate(
//                new UsernamePasswordAuthenticationToken(username, password)
//            );
//            SecurityContextHolder.getContext().setAuthentication(authentication);
//
//            User user = userService.findByUsername(username).orElse(null);
//            if (user != null) {
//                session.setAttribute("loggedInUser", user);
//                return "redirect:/auth/redirect-by-role";
//            }
//        } catch (Exception e) {
//            // log the exception if needed
//        }
//
//        model.addAttribute("error", "Invalid username or password.");
//        return "auth/login";
//    }
//
//    @GetMapping("/redirect-by-role")
//    public String redirectByRole(HttpSession session) {
//        User user = (User) session.getAttribute("loggedInUser");
//        if (user != null) {
//            switch (user.getRole().toUpperCase()) {
//                case "ADMIN":
//                    return "redirect:/admin/dashboard";
//                case "STAFF":
//                    return "redirect:/staff/dashboard";
//            }
//        }
//        return "redirect:/auth/login?error=true";
//    }
//
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        SecurityContextHolder.clearContext();
//        return "redirect:/auth/login?logout=true";
//    }
//}
package iostar.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import iostar.entity.User;
import iostar.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String loginPage() {
        return "auth/login";
    }

    @GetMapping("/redirect-by-role")
    public String redirectByRole(Authentication authentication, HttpSession session) {
        String username = authentication.getName();
        User user = userService.findByUsername(username).orElse(null);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            switch (user.getRole().toUpperCase()) {
                case "ADMIN":
                    return "redirect:/admin/dashboard";
                case "STAFF":
                    return "redirect:/staff/dashboard";
            }
        }
        return "redirect:/auth/login?error=true";
    }
}
