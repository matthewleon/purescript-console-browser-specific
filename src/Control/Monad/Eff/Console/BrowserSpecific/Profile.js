"use strict";

exports["profileLabeled'"] = function (s) {
  return function () {
    console.profile(s);
    return {};
  };
};

exports["profileEndLabeled'"] = function (s) {
  return function () {
    console.profileEnd(s);
    return {};
  };
};

exports.profile = function () {
  console.profile();
  return {};
};

exports.profileEnd = function () {
  console.profileEnd();
  return {};
};
