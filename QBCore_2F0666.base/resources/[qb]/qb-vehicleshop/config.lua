Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'

-- rp-dealership marker dışından araç satın almayı kapat (showroom / vitrin etkileşimi)
Config.EnableClientShops = false

Config.Commission = 0.10               -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05        -- Percent that goes to sales person from a finance sale 5%
Config.PaymentWarning = 10             -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24            -- time in hours between payment being due
Config.MinimumDown = 10                -- minimum percentage allowed down
Config.MaximumPayments = 24            -- maximum payments allowed
Config.PreventFinanceSelling = false   -- allow/prevent players from using /transfervehicle if financed
Config.FilterByMake = false            -- adds a make list before selecting category in shops
Config.SortAlphabetically = true       -- will sort make, category, and vehicle selection menus alphabetically
Config.HideCategorySelectForOne = true -- will hide the category selection menu if a shop only sells one category of vehicle or a make has only one category
Config.Shops = {
    -- Tüm vitrin galerileri kapalı — araç satın alma: rp-dealership marker
}
