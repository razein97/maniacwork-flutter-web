'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "f94623221219fa666cec66af85dda0a0",
"/manifest.json": "1f4009d2bf821c6eefe23e53b14a8104",
"/404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/LICENSE": "7475bbc435dba46a92f50054238e0a38",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/assets/assets/images/logo/LOGO_alpha.png": "3571f263f90482ed905324204dd6c3ad",
"/assets/assets/images/logo/LOGO_rounded_border.png": "d192050d77c570f27c7deaff16a48b68",
"/assets/AssetManifest.json": "e73d192fd81838f10415579c34bffade",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/main.dart.js": "beb4814ecdedf3082e5f8a0d30870f5b"
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
