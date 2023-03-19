openapi: 3.0.0
servers:
  # Added by API Auto Mocking Plugin
  - description: SwaggerHub API Auto Mocking
    url: https://virtserver.swaggerhub.com/PM6870365_1/studiumprzypadkuXXX/1.0.0
info:
  description: This is a simple API
  version: "1.0.0"
  title: Simple Inventory API
  contact:
    email: you@your-company.com
  license:
    name: Apache 2.0
    url: 'http://www.apache.org/licenses/LICENSE-2.0.html'
tags:
  - name: uczestnicy kursów językowych
    description: zapisuje użtkowników na kursy
  - name: developers
    description: Operations available to regular developers
paths:
  '/kursy/{userId}':
    get:
      tags:
        - szkoła języków obcych
      summary: apka do zapisu na kursy
      operationId: getUserID
      produces:
        - application/json
        - application/xml
      description: |
        wyrzuca uczniów po id
      parameters:
        - in: path
          name: userID
          description: kod kursu
          required: true
          type: string
          maxLength: 100
          
       
      responses:
        '200':
          description:ok
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/definitions/User'
        '400':
          description: Błędny kod
        '404':
          description: Towar nie został znaleziony
        '405':
          description: Błąd danych wejściowych
    post:
      tags:
        - szkoła i uczniowie
      summary: aktualizacja uczniów
      operationId: addUser
      description: ""
      consumes:
        - application/json
        - application/xml
      produces:
        - application/xml
        - application/json
      parameters:
        - name: userId
          in: path
          description: Kod kursu
          required: true
          type: string
          maxLength: 100
        - in: body
          name: body
          description: Obiekt opisujący kurs
          required: true
          schema:
            $ref: '#/definitions/User'
      responses:
        '201':
          description: Błędny kod
        '404':
          description: Towar nie został znaleziony
        '405':
          description: Błąd danych wejściowych
        '400':
          
    /user:
      post:
      tags:
        - użtkownicy
      summary: Dodaje nowych użtkowników
      description: ''
      operationId: addUser
      consumes:
        - application/json
        - application/xml
      produces:
        - application/xml
        - application/json
      parameters:
        - in: body
          name: body
          description: Obiekt opisujący użtkowników
          required: true
          schema:
            $ref: '#/definitions/user'
      responses:
        '405':
          description: Błąd danych wejściowych
      
      post:
      tags:
        - użtkownicy
      summary: Dodaje nowych użtkowników
      description: ''
      operationId: delUser
      consumes:
        - application/json
        - application/xml
      produces:
        - application/xml
        - application/json
      parameters:
        - in: body
          name: body
          description: Obiekt opisujący użtkowników
          required: true
          schema:
            $ref: '#/definitions/user'
      responses:
        '405':
          description: Błąd danych wejściowych
      
     /kursy:
    get:
      tags:
        - kursy
      summary: Zwraca listę kursów
      responses:
        '200':
          description: Ok
  '/grupa/{grupaId}':
    get:
      tags:
        - grupa
      summary: Zwraca grupę po kodzie
      description: ''
      operationId: getGroupId
      produces:
        - application/json
        - application/xml
      parameters:
        - name: GroupId
          in: path
          description: Kod grupy
          required: true
          type: string
          maxLength: 100
      responses:
        '200':
          description: OK
          schema:
            $ref: '#/definitions/Kontrahent'
        '400':
          description: Błędny kod grupy
        '404':
          description: grupa nie został znaleziony
    post:
      tags:
        - grupa
      summary: Aktualizacja danych grupy
      description: ''
      operationId: updateGroup
      consumes:
        - application/json
        - application/xml
      produces:
        - application/xml
        - application/json
      parameters:
        - name: GroupID
          in: path
          description: Kod grupy
          required: true
          type: string
          maxLength: 100
        - in: body
          name: body
          description: Obiekt opisujący grupę
          required: true
          schema:
            $ref: '#/definitions/group'
      responses:
        '400':
          description: Błędny kod grupy
        '404':
          description: grupa nie został znaleziony
        '405':
          description: Błąd danych wejściowych
          
    /grupa:
    post:
      tags:
        - grupa
      summary: Dodaje nową grupę do bazy
      description: ''
      operationId: addGroup
      consumes:
        - application/json
        - application/xml
      produces:
        - application/xml
        - application/json
      parameters:
        - in: body
          name: body
          description: Obiekt opisujący grupę
          required: true
          schema:
            $ref: '#/definitions/group'
      responses:
        '405':
          description: Błąd danych wejściowych
    post:
      tags:
        - grupa
      summary: usówa nową grupę do bazy
      description: ''
      operationId: delGroup
      consumes:
        - application/json
        - application/xml
      produces:
        - application/xml
        - application/json
      parameters:
        - in: body
          name: body
          description: Obiekt opisujący grupę
          required: true
          schema:
            $ref: '#/definitions/group'
      responses:
        '405':
          description: Błąd danych wejściowych
    
          
          
          description: an existing item already exists
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/InventoryItem'
        description: Inventory item to add
components:
  schemas:
    InventoryItem:
      type: object
      required:
        - id
        - name
        - manufacturer
        - releaseDate
      properties:
        id:
          type: string
          format: uuid
          example: d290f1ee-6c54-4b01-90e6-d701748f0851
        name:
          type: string
          example: Widget Adapter
        releaseDate:
          type: string
          format: date-time
          example: '2016-08-29T09:12:33.001Z'
        manufacturer:
          $ref: '#/components/schemas/Manufacturer'
    Manufacturer:
      required:
        - name
      properties:
        name:
          type: string
          example: ACME Corporation
        homePage:
          type: string
          format: url
          example: 'https://www.acme-corp.com'
        phone:
          type: string
          example: 408-867-5309
      type: object
