'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "f94623221219fa666cec66af85dda0a0",
"/manifest.json": "1f4009d2bf821c6eefe23e53b14a8104",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/LICENSE": "136c2d2f15a03bb8d1ea476a171efe88",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/assets/assets/images/movies/weeping_emperor/poster_hd.png": "a893da4542812f57d9b9e741e5fc9095",
"/assets/assets/images/movies/bg.jpg": "312d14e91ea3e508bf8413cdb5263128",
"/assets/assets/images/movies/bg.gif": "8ffb2d10152d14ff605bbba8473761fb",
"/assets/assets/images/carousel_images/scr3.jpg": "c4372a4b92c87964ec412d35b5b61f86",
"/assets/assets/images/carousel_images/scr1.jpg": "6e07dc2f372b0834612b1b3e7f6ab9be",
"/assets/assets/images/carousel_images/scr2.jpg": "904b276919e603353c9f69931ca0ab26",
"/assets/assets/images/logo/LOGO_alpha.png": "3571f263f90482ed905324204dd6c3ad",
"/assets/assets/images/logo/LOGO_rounded_border.png": "d192050d77c570f27c7deaff16a48b68",
"/assets/AssetManifest.json": "6a9d62441791fb22340b83833ed7be70",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/main.dart.js": "f5b43f021a1fe1234c94d4a963565e62"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
