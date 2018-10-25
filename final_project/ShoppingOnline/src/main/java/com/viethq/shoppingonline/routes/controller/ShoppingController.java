package com.viethq.shoppingonline.routes.controller;

import com.viethq.shoppingonline.entities.User;
import com.viethq.shoppingonline.model.cart.Cart;
import com.viethq.shoppingonline.model.cart.CartItem;
import com.viethq.shoppingonline.services.CartService;
import com.viethq.shoppingonline.utils.routes.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.security.Principal;

@Controller
@RequestMapping("/cart")
public class ShoppingController {


    private CartService cartService;

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }


    @GetMapping("")
    private ModelAndView index(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        ModelAndView mav = new ModelAndView("/shop/index");
        cartService.updateProductList(cart);
        session.setAttribute("cart", cart);
        return mav;
    }

    @GetMapping("/order")
    private ModelAndView order(@RequestParam("productId") int productId,
                               @RequestParam("quantity") int quantity,
                               HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        CartItem cartItem = new CartItem();
        cartItem.setProductId(productId);
        cartItem.setQuantity(quantity);
        cart.addCartItem(cartItem);
        session.setAttribute("cart", cart);
        return new ModelAndView(URL.REDIRECT_CART);
    }


    @GetMapping("/remove")
    private ModelAndView remove(@RequestParam("productId") int productId, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        cart.removeCartItem(productId);
        session.setAttribute("cart", cart);
        return new ModelAndView("/shop/index");
    }


    @GetMapping("/finish")
    private ModelAndView finishOrder(Principal principal, HttpSession session) {
        if (principal == null) {
            return new ModelAndView("/403denied");
        }
        String username = principal.getName();
        User user = cartService.findUserByUsername(username);
        Cart cart = (Cart) session.getAttribute("cart");
        cartService.saveOrder(cart, user);
        session.setAttribute("cart", new Cart());
        return new ModelAndView(URL.REDIRECT_HOME);
    }

}
