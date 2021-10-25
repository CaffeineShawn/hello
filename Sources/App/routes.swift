import Vapor


struct Greeting: Content {
    var hello: String
}

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    app.get("hello", "vapor") { req in
        return "Hello, vapor!"
    }
    app.on(.GET, "hello", "vapor") { req in
        return "Hello vapor!"
    }
    app.get("hello", ":name") { req -> String in
        let name = req.parameters.get("name")!
        return "Hello, \(name)!"
    }
    app.post("greeting") { req -> HTTPStatus in
        let greeting = try req.content.decode(Greeting.self)
        print(greeting.hello)
        return HTTPStatus.ok
        
    }
}
