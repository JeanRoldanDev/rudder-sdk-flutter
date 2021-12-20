!function () {
  var e = window.rudderanalytics = window.rudderanalytics || []; e.methods = ["load", "page", "track", "identify", "alias", "group", "ready", "reset", "getAnonymousId", "setAnonymousId"], e.factory = function (t) { return function () { var r = Array.prototype.slice.call(arguments); return r.unshift(t), e.push(r), e } }; for (var t = 0; t < e.methods.length; t++) { var r = e.methods[t]; e[r] = e.factory(r) } e.loadJS = function (e, t) { var r = document.createElement("script"); r.type = "text/javascript", r.async = !0, r.src = "https://cdn.rudderlabs.com/v1/rudder-analytics.min.js"; var a = document.getElementsByTagName("script")[0]; a.parentNode.insertBefore(r, a) }, e.loadJS()
}();

function initializeSDK(writeKey, dataPlane) {
  window.rudderanalytics.load(writeKey, dataPlane);
  window.rudderanalytics.page()
  window.rudderanalytics.ready(() => { console.warn('rudder loaded!!!'); })
}

function trackEvent(event, properties, options) {
  var jsonProperties = JSON.parse(properties);
  window.rudderanalytics.track(
    event,
    jsonProperties,
    () => { console.log("in track call"); }
  );
}

function identify(userId, traits) {
  var jsonTraits = JSON.parse(traits);
  rudderanalytics.identify(
    userId,
    jsonTraits,
    () => {
      console.warn("in identify call");
    }
  );
}
