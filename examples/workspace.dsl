workspace {

    model {
        user = person "User"

        mesh = softwareSystem "Solace Event Mesh" {
            tags "Solace - Event Mesh"

            broker_eu = container "Solace Broker EU" {
                tags "Solace - Event Broker"
                description "Solace PubSub+ Enterprise Broker, hosted in EU Datacenter"
                technology "PubSub+ Enterprise Software 10K"
            }

            broker_us_east = container "Solace Broker US East" {
                tags "Solace - Event Broker"
                technology "PubSub+ Enterprise Software 100K"
                properties {
                    HA true
                }

                this -> broker_eu "Establishes DMR Link" {
                    tags "Solace - DMR Link"
                }
            }

            broker_us_west = container "Solace Broker US West" {
                tags "Solace - Event Broker"
                technology "PubSub+ Enterprise Software 10K"
                

                
                this -> broker_us_east "Establishes DMR Link" {
                    tags "Solace - DMR Link"
                }
                this -> broker_eu "Establishes DMR Link" {
                    tags "Solace - DMR Link"
                }
            }
        }


        user -> broker_eu "Uses"
    }

    views {
        theme "https://andreas-habel.github.io/github-pages/solace-structurizr-theme/theme.json"
        
        systemContext mesh "GlobalEventMesh" {
            include *
        }

        container mesh "MeshDetails" {
            include *
        }

        styles {
        }
    }

    configuration {
        scope softwaresystem
    }

}