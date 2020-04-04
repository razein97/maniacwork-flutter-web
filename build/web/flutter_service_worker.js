'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "d8c32bc28009c3ed858075127d307f90",
"/manifest.json": "1f4009d2bf821c6eefe23e53b14a8104",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/packages/open_iconic_flutter/assets/open-iconic.woff": "3cf97837524dd7445e9d1462e3c4afe2",
"/assets/LICENSE": "44949e6e10bbd2feb6c6be6dbd9b3c30",
"/assets/FontManifest.json": "96880f5cbd12a15751331cdbdac93202",
"/assets/assets/images/movies/weeping_emperor/poster_hd.png": "a893da4542812f57d9b9e741e5fc9095",
"/assets/assets/images/movies/bg.jpg": "312d14e91ea3e508bf8413cdb5263128",
"/assets/assets/images/movies/bg.gif": "8ffb2d10152d14ff605bbba8473761fb",
"/assets/assets/images/carousel_images/scr3.jpg": "c4372a4b92c87964ec412d35b5b61f86",
"/assets/assets/images/carousel_images/scr1.jpg": "6e07dc2f372b0834612b1b3e7f6ab9be",
"/assets/assets/images/carousel_images/scr2.jpg": "904b276919e603353c9f69931ca0ab26",
"/assets/assets/images/logo/LOGO_alpha.png": "3571f263f90482ed905324204dd6c3ad",
"/assets/assets/images/logo/LOGO_rounded_border.png": "d192050d77c570f27c7deaff16a48b68",
"/assets/assets/icons/480p_24px.png": "f94a4d25be69edab746455cddee8a4b7",
"/assets/assets/icons/720p_24px.png": "5ee546b9b08e8bda6771884aa5e8b15a",
"/assets/assets/icons/1080p_24px.png": "95a3deb96a57ba1909a2758d3151132b",
"/assets/AssetManifest.json": "4e17f991826a5f4f60ad43e43aca62f3",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/main.dart.js": "9bd7f3daddb19287bd125e0425b21581"
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
