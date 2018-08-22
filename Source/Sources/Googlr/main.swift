let tool = Googlr()

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
