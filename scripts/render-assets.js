'use strict';
const fs = require('fs');
const upath = require('upath');
const sh = require('shelljs');

module.exports = function renderAssets() {
    const sourcePath = upath.resolve(upath.dirname(__filename), '../src/assets');
    const destPath = upath.resolve(upath.dirname(__filename), '../dist/.');

    sh.cp('-R', sourcePath, destPath);

    // also copy some static files:
    const staticSourcePath = upath.resolve(upath.dirname(__filename), '../src');
    const staticDestPath   = upath.resolve(upath.dirname(__filename), '../dist/.');

    sh.cp(staticSourcePath + '/404.html', staticDestPath + '/404.html');
    sh.cp(staticSourcePath + '/thanks.html', staticDestPath + '/thanks.html');
    sh.cp(staticSourcePath + '/robots.txt', staticDestPath + '/robots.txt');
    sh.cp('-R', staticSourcePath + '/.well-known', staticDestPath + '/.well-known');
};
