(function () {
    function pad(n) {
        return n < 10 ? '0' + n : String(n);
    }

    function addTimestamp(node) {
        if (!node || node.dataset.tsDone) return;
        node.dataset.tsDone = '1';

        var now = new Date();
        var ts = document.createElement('span');
        ts.className = 'timestamp';
        ts.textContent = '[' + pad(now.getHours()) + ':' + pad(now.getMinutes()) + ':' + pad(now.getSeconds()) + '] ';
        node.insertBefore(ts, node.firstChild);
    }

    function watchMessages() {
        var container = document.querySelector('.chat-messages');
        if (!container) {
            setTimeout(watchMessages, 250);
            return;
        }

        container.querySelectorAll('.msg').forEach(addTimestamp);

        new MutationObserver(function (mutations) {
            mutations.forEach(function (m) {
                m.addedNodes.forEach(function (node) {
                    if (node.nodeType === 1 && node.classList && node.classList.contains('msg')) {
                        addTimestamp(node);
                    }
                });
            });
        }).observe(container, { childList: true });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', watchMessages);
    } else {
        watchMessages();
    }
})();
