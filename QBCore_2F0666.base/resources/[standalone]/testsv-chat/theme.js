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

    // Chat penceresini her zaman görünür tut (varsayılan 7sn fade kapalı)
    function forceChatVisible() {
        var win = document.querySelector('.chat-window');
        if (!win) return;
        win.style.setProperty('display', 'block', 'important');
        win.style.setProperty('opacity', '1', 'important');
        win.style.setProperty('visibility', 'visible', 'important');
    }

    // FiveM hideState: AlwaysShow = 1
    window.addEventListener('message', function (event) {
        var data = event.data;
        if (!data || !data.type) return;
        if (data.type === 'ON_SCREEN_STATE_CHANGE') {
            data.hideState = 1;
        }
        if (data.type === 'ON_MESSAGE' || data.type === 'ON_OPEN') {
            requestAnimationFrame(forceChatVisible);
        }
    }, true);

    setInterval(forceChatVisible, 500);

    function watchMessages() {
        var container = document.querySelector('.chat-messages');
        if (!container) {
            setTimeout(watchMessages, 250);
            return;
        }

        forceChatVisible();
        container.querySelectorAll('.msg').forEach(addTimestamp);

        new MutationObserver(function (mutations) {
            mutations.forEach(function (m) {
                m.addedNodes.forEach(function (node) {
                    if (node.nodeType === 1 && node.classList && node.classList.contains('msg')) {
                        addTimestamp(node);
                    }
                });
            });
            forceChatVisible();
        }).observe(container, { childList: true });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', watchMessages);
    } else {
        watchMessages();
    }
})();
