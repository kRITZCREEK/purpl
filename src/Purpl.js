var vm = require('vm');

function mkScriptImpl(code) {
    return new vm.Script(code);
}

function runInContextImpl(ctx, script) {
    return script.runInContext(ctx);
}
function createContextImpl(r) {
    return vm.createContext(r);
};

exports.jsonparse = function(s) { return JSON.parse(s); };
exports.mkScriptImpl = mkScriptImpl;
exports.runInContextImpl = runInContextImpl;
exports.require = require;
exports.createContextImpl = createContextImpl;
