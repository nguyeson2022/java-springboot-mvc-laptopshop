package vn.hoidanit.laptopshop.config;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;
<<<<<<< HEAD
=======
<<<<<<< HEAD
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

    protected String determineTargetUrl(final Authentication authentication) {

        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_USER", "/");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if (roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }

        throw new IllegalStateException();
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
<<<<<<< HEAD
=======
<<<<<<< HEAD

        // get email
        String email = authentication.getName();
        // get user
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
        // get email
        String email = authentication.getName();
        // query user
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("user", user);
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("avatar", user.getAvatar());
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());
            int sum = user.getCart() == null ? 0 : user.getCart().getSum();
            session.setAttribute("sum", sum);
<<<<<<< HEAD

=======
<<<<<<< HEAD
=======

>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
        }

    }

<<<<<<< HEAD
=======
<<<<<<< HEAD
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        // TODO Auto-generated method stub
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
        String targetUrl = determineTargetUrl(authentication);

        if (response.isCommitted()) {

            return;
        }
<<<<<<< HEAD
=======
<<<<<<< HEAD
        redirectStrategy.sendRedirect(request, response, targetUrl);
        clearAuthenticationAttributes(request, authentication);
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

        redirectStrategy.sendRedirect(request, response, targetUrl);
        clearAuthenticationAttributes(request, authentication);

<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
    }

}
