// Map function

func myMap<Element>(elements: [Element],
                  transform: (Element) -> Element) -> [Element] {
    var result: [Element] = []
    
    for element in elements {
        result.append(transform(element))
    }
    return result
}

let myMapArr = [1,2,3,4,5,6]

print(myMap(elements: myMapArr, transform: {$0*20}))

extension Array {
    func customMap(transform: (Element) -> Element) -> [Element] {
        var result: [Element] = []
        var iterator = makeIterator()
        
        while let element = iterator.next() {
            result.append(transform(element))
        }
        return result
    }
    
    func customFilter(transform: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        var iterator = makeIterator()
        
        while let element = iterator.next() {
            if transform(element) {
                result.append(element)
            }
        }
        return result
    }
    
    func customReduce<Value>(initialValue: Value,
                             partialResult: (Element, Value) -> Value) -> Value {
        var result = initialValue
        
        var iterator = makeIterator()
        
        while let element = iterator.next() {
            result = partialResult(element, result)
        }
        
        return result
    }
}

print(myMapArr.customMap(transform: {$0*20}))

// Filter function

func filter<Element>(elements: [Element],
                     transform: (Element) -> Bool) -> [Element] {
    var result: [Element] = []
    for element in elements where transform(element) {
        result.append(element)
    }
    return result
}

let myFilterArr = [1,2,3,4,5,6]
let myFilterStringArr = ["Dog", "Elephant", "Ant"]
print(filter(elements: myFilterArr, transform: {$0 % 2 == 0}))
print(myFilterStringArr.customFilter(transform: {$0.count > 3}))


// Reduce Function

func reduce<Value, Element>(initialResult: Value,
                           elements: [Element],
                           partialResult: (Element, Value) -> Value) -> Value {
    var result = initialResult
    
    for element in elements {
        result = partialResult(element, result)
    }
    
    return result
}

let rediceArr = [1,2,3,4,5,6]
print(reduce(initialResult: 0, elements: rediceArr, partialResult: {$0 + $1}))
print(rediceArr.customReduce(initialValue: 0, partialResult: {$0 + $1}))


// Flat Map

func flatMap<Element>(elements: [[Element]],
                      transform: (Element) -> Element) -> [Element] {
    var result: [Element] = []
    
    for elementArr in elements {
        for element in elementArr {
            result.append(transform(element))
        }
    }
    
    return result
}

let flatMapArr = [[1,2], [2,4]]
print(flatMap(elements: flatMapArr, transform: {$0+7}))











































