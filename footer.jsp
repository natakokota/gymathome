<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    body {
        margin: 0;
        padding-bottom: 50px; /* footer height */
        position: relative;
    }

    .footer {
        background-color: black;
        color: #fff;
        text-align: center;
        padding: 10px 0;
        width: 100%;
        position: absolute; /* Initially absolute */
        bottom: 0;
        z-index: 3; 
        transition: all 0.5s ease; /* Add smooth transition */
    }
</style>

<!-- FOOTER -->
<footer class="footer">
    <p class="mb-0">© Copyright Gym@Home. All Rights Reserved</p>
</footer>

<script>
    window.onscroll = function () {
        var footer = document.querySelector('.footer');
        var scrollPosition = window.scrollY;
        var windowHeight = window.innerHeight;
        var bodyHeight = document.body.offsetHeight;

        if (scrollPosition + windowHeight >= bodyHeight) {
            // If user scrolled to the end of the page, fix the footer
            footer.style.position = 'fixed';
        } else {
            footer.style.position = 'absolute';
        }
    };
</script>

<!-- Bootstrap 3 JavaScript files (if needed) -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
