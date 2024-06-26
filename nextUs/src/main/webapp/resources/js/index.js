/**
 * 
 */
 $(document).ready(function () {
    let currentIndex = 0;
    const banners = $('#main_banner_container .banner');
    const totalBanners = banners.length;
    const bannerWrapper = $('.banner-wrapper');
    let slideInterval;

    function startSlider() {
        slideInterval = setInterval(nextBanner, 5000);
    }

    function resetSlider() {
        clearInterval(slideInterval);
        startSlider();
    }

    function showBanner(index) {
        const offset = -index * 100; // Calculate the offset percentage
        bannerWrapper.css('transform', 'translateX(' + offset + '%)');
        currentIndex = index;
    }

    function nextBanner() {
        const nextIndex = (currentIndex + 1) % totalBanners;
        showBanner(nextIndex);
    }

    function prevBanner() {
        const prevIndex = (currentIndex - 1 + totalBanners) % totalBanners;
        showBanner(prevIndex);
    }

    $('.arrow.right').click(function() {
        nextBanner();
        resetSlider();
    });

    $('.arrow.left').click(function() {
        prevBanner();
        resetSlider();
    });

    // Initialize the first banner and start the slider
    showBanner(currentIndex);
    startSlider();
});