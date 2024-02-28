workspace {

    model {
        user = person "User"

        broker = softwareSystem "Solace Broker" {
            tags "Solace - Event Broker"
        }

        user -> broker "Uses"
    }

    views {
        theme "https://andreas-habel.github.io/github-pages/solace-structurizr-theme/theme.json"
        
        systemContext broker "Diagram1" {
            include *
        }
    }

    configuration {
        scope softwaresystem
    }

}