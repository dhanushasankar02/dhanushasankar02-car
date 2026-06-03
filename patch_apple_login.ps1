$loginPath = "d:\groww\car\login.html"
$loginContent = [System.IO.File]::ReadAllText($loginPath, [System.Text.Encoding]::UTF8)

# Add Apple sign in option to login
$appleLoginBtn = '                <a href="#" class="social-btn" id="appleLoginBtn" title="Sign in with Apple">
                    <i class="fab fa-apple"></i>
                </a>'
$loginContent = $loginContent -replace '<a href="#" class="social-btn" id="googleLoginBtn" title="Sign in with Google">', "$appleLoginBtn`n                <a href=`"#`" class=`"social-btn`" id=`"googleLoginBtn`" title=`"Sign in with Google`">"

# Add event listener for Apple in login
$appleLoginScript = "            const appleBtn = document.getElementById('appleLoginBtn');
            if (appleBtn) {
                appleBtn.addEventListener('click', (e) => {
                    e.preventDefault();
                    alert('ðŸŽ Apple sign-in would be implemented here.\\n\\nâœ¨ Welcome back to Velocity!');
                });
            }`n"
$loginContent = $loginContent -replace '            const googleBtn = document.getElementById\(''googleLoginBtn''\);', "$appleLoginScript`n            const googleBtn = document.getElementById('googleLoginBtn');"

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($loginPath, $loginContent, $utf8NoBom)


$registerPath = "d:\groww\car\register.html"
$registerContent = [System.IO.File]::ReadAllText($registerPath, [System.Text.Encoding]::UTF8)

# Add Apple sign up option to register
$appleRegisterBtn = '                <a href="#" class="social-btn" id="appleSignupBtn" title="Sign up with Apple">
                    <i class="fab fa-apple"></i>
                </a>'
$registerContent = $registerContent -replace '<a href="#" class="social-btn" id="googleSignupBtn" title="Sign up with Google">', "$appleRegisterBtn`n                <a href=`"#`" class=`"social-btn`" id=`"googleSignupBtn`" title=`"Sign up with Google`">"

# Add event listener for Apple in register
$appleRegisterScript = "            const appleSignupBtn = document.getElementById('appleSignupBtn');
            if (appleSignupBtn) {
                appleSignupBtn.addEventListener('click', (e) => {
                    e.preventDefault();
                    alert('ðŸŽ Apple sign-up would be implemented here.\\n\\nâœ¨ Welcome to the Velocity family!');
                });
            }`n"
$registerContent = $registerContent -replace '            const googleSignupBtn = document.getElementById\(''googleSignupBtn''\);', "$appleRegisterScript`n            const googleSignupBtn = document.getElementById('googleSignupBtn');"

[System.IO.File]::WriteAllText($registerPath, $registerContent, $utf8NoBom)
Write-Host "Done"
