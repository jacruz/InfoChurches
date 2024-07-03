# InfoChurches. API reference.

## Recurso CHURCHES

#### Buscar iglesias a mi alrededor

<details>
 <summary><code>GET</code> <code><b>/v1/churches/nearby-search</b></code> <code>(obtiene las información de las iglesias cuya ubicación se encuentre a una distancia dada a la redonda de un punto dado)</code></summary>

##### Sample URI
<code>https://localhost:3000/api/v1/churches/nearby-search?lat=4.643829&lon=-74.175382&distance=2</code>

##### Query parameters

> | name              |  type     | data type   | description                                           |
> |-------------------|-----------|-------------|-------------------------------------------------------|
> | `lat`             |  required | decimal     | Coordenada 'latitud' de la ubicación inicial. Separación decimal con símbolo punto "." |
> | `lon`             |  required | decimal     | Coordenada 'longitud' de la ubicación inicial. Separación decimal con símbolo punto "." |
> | `distance`        |  required | decimal     | Distancia en kilómetros a la redonda a buscar. Separación decimal con símbolo punto "." |

##### Responses

> | http code     | content-type                      | response                                                            |
> |---------------|-----------------------------------|---------------------------------------------------------------------|
> | `200`         | `application/json`                | JSON (Ver 'Res sample')                                             |
> | `404`         | `application/json`                | `{message: 'No churches found nearby'}`          |
> | `500`         | `application/json`                | `{message: error.message \|\| 'Error getting churches nearby'}`     |


##### Res sample
<pre>
[
    {
        "name": "Parroquia Santa María de Guadalupe",
        "img": "https://lh5.googleusercontent.com/p/AF1QipMsJ7CyLAWDv8D2shV_UlH-FDiG_KLpd_m5wDgx=w600-h321-p-k-no",
        "priest": "Manuel Eduardo Acevedo Ospina",
        "location": {
            "direction": "Carrera 90 No. 42 A 37 Sur",
            "country": "Colombia",
            "city": "Bogotá",
            "lat": "4.63862200",
            "lon": "-74.17308100",
            "distance": {
                "origin": {
                    "lat": "4.643829",
                    "lon": "-74.175382"
                },
                "value": 0.6333754649604719
            }
        },
        "contact": {
            "mobile_number": "3213408321",
            "landline_number": "4819395",
            "links": [
                {
                    "name": "whatsapp",
                    "value": "3213408321"
                },
                {
                    "name": "facebook",
                    "value": "https://www.facebook.com/parroquia.guadalupedindalito/"
                }
            ]
        },
        "schedules": [
            {
                "name": "mass",
                "value": [
                    {
                        "days_of_week": "monday",
                        "times": [
                            {
                                "start": "18:00"
                            }
                        ]
                    },
                    {
                        "days_of_week": "tue-sat",
                        "times": [
                            {
                                "start": "7:00"
                            },
                            {
                                "start": "18:00"
                            }
                        ]
                    },
                    {
                        "days_of_week": "sunday",
                        "times": [
                            {
                                "start": "7:00"
                            },
                            {
                                "start": "9:00"
                            },
                            {
                                "start": "11:00"
                            },
                            {
                                "start": "17:00"
                            },
                            {
                                "start": "19:00"
                            }
                        ]
                    }
                ]
            },
            {
                "name": "parish office",
                "value": [
                    {
                        "days_of_week": "mon-sat",
                        "times": [
                            {
                                "start": "14:00",
                                "end": "17:00"
                            }
                        ]
                    }
                ]
            }
        ]
    }
]
</pre>



</details>
