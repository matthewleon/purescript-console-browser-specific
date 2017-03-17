"use strict";

exports.clear = function () {
  console.clear();
  return {};
};

exports.dir = function (x) {
  return function () {
    console.dir(x);
    return {};
  };
};

exports.timeStamp = function () {
  console.timeStamp();
  return {};
};

exports.trace = function () {
  console.trace();
  return {};
};
