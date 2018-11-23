import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Best stories started with a salad", "Best stories started with lots of a drinks"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
