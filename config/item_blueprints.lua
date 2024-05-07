-- the blueprint will have an id attached and will then index the table to provide the proper information such as required items, etc etc
Config.blueprints = {
    ids = {
        attachments = {
            {
                blueprintId = 'blueprint_lockpick',
                id = 99991,
                itemName = 'lockpick',
                name = 'Lockpick',
                image = 'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=6632e6f6&is=66319576&hm=d1b2b99f3b0dcaf623bc9f523f88be295ebc4418c7efb11c3f231b0480e50e1c&=&format=webp&quality=lossless',
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a lockpick',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'goldbar',
                        name = 'Gold Bars',
                        amount = 2,
                        myAmount = 2,
                        image = 'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=6632e6f6&is=66319576&hm=d1b2b99f3b0dcaf623bc9f523f88be295ebc4418c7efb11c3f231b0480e50e1c&=&format=webp&quality=lossless',
                    },
                },
            },
        },
        misc = {
            {
                blueprintId = 'blueprint_lockpick',
                id = 99991,
                itemName = 'lockpick',
                name = 'Lockpick',
                image = 'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=6632e6f6&is=66319576&hm=d1b2b99f3b0dcaf623bc9f523f88be295ebc4418c7efb11c3f231b0480e50e1c&=&format=webp&quality=lossless',
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a lockpick',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'goldbar',
                        name = 'Gold Bars',
                        amount = 2,
                        myAmount = 2,
                        image = 'https://media.discordapp.net/attachments/789185814768386088/1233403703856201739/paintscraper.png?ex=6632e6f6&is=66319576&hm=d1b2b99f3b0dcaf623bc9f523f88be295ebc4418c7efb11c3f231b0480e50e1c&=&format=webp&quality=lossless',
                    },
                },
            },
        }
    },

    -- These are all the useable items in which it create a useable item
    items = {
        'blueprint_lockpick',
    },
}
