<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <%@ include file = "setup.jsp" %>

</head>
<body>
<div class="container w-full h-screen flex justify-center items-center font-poppin">
    <div class="login-container border-2 border-[#4262DA] w-custom h-custom flex rounded-3xl overflow-hidden ">
        <div class="first-section bg-[#4262DA]  w-2/4 flex flex-col items-center justify-center space-y-14 text-[#ffffff]">
            <div class="login-title text-6xl font-semibold">
                Hello, Dear!
            </div>
            <div class="login-form text-center px-14">
                <p>Welcome to our Rental car agency</p>
                <p>please enter you personal details, and start journey with us</p>
            </div>
            <div class="subscription px-4 py-2 border-2 border-[#ffffff] rounded-lg">
                <a href="registration.jsp"><input class="cursor-pointer" type="button" value="Sign Up"></a>

            </div>
        </div>

        <div class="second-section pt-2 flex flex-col items-center justify-center space-y-16 bg-[#ffffff] w-2/4">
            <div class="login-title text-6xl font-semibold">
                Sign in
            </div>
            <div class="login-form-container flex flex-col items-center justify-center">
                <div class="login-form ">
                    <form class="flex flex-col items-center" action="login-servlet" method="post">
                        <div class="inputs space-y-4">
                            <div class="email">
                                <input class="outline-none w-80 h-12 pl-4 bg-[#DBDBDB] rounded-xl" placeholder="Email" type="email" id="email" name="email">
                            </div>
                            <div class="password">
                                <input class="w-80 h-12 pl-4 outline-none  bg-[#DBDBDB] rounded-xl" placeholder="Password" type="password" id="password" name="password">
                            </div>
                            <div class="text-[#A44646] text-center text-sm">
                                ${error}
                            </div>
                        </div>
                        <div class="submit mt-12 px-4 py-2 border-2 border-[#4262DA] rounded-lg">
                            <input class="text-[#4262DA] cursor-pointer" type="submit" value="SIGN IN">
                        </div>
                    </form>
                </div>
                <div class="login-forget text-normal">
                    <span class="text-[#B2B2B2]">Forgot </span><a href="enterEmail.jsp" class="inline hover:underline text-[#747373]">Username / Password?</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>