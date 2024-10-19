document.addEventListener('DOMContentLoaded', function() {
    const blocks = document.querySelectorAll('.block');

    // Make the first block visible initially
    if (blocks.length > 0) {
        blocks[0].classList.add('visible');
    }

    function checkVisibility() {
        blocks.forEach(block => {
            const rect = block.getBoundingClientRect();
            if (rect.top < window.innerHeight && rect.bottom >= 0) {
                block.classList.add('visible');
            } else {
                block.classList.remove('visible');
            }
        });
    }

    window.addEventListener('scroll', checkVisibility);
    checkVisibility(); // Initial check
});