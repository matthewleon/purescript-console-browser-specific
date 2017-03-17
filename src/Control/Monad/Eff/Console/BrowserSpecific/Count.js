"use strict";

exports.count = function () {
  console.count();
  return {};
};

exports["countLabel'"] = function (s) {
  return function () {
    console.count(s);
    return {};
  };
};
