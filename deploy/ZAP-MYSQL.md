# Zap MySQL

Bağlantı bilgileri `deploy/server.cfg.template` ve `recipe.yaml` içinde (MySQL).

**CFX license key** GitHub push koruması yüzünden repoda olamaz — txAdmin → Deploy adım 2 veya Settings → FXServer → `sv_licenseKey` satırına yapıştır.

Güncelleme recipe deploy sonunda `{{dbConnectionString}}` kalmışsa otomatik düzeltir.

**Deploy sonrası:** txAdmin → Restart → konsolda oxmysql hatası olmamalı.
