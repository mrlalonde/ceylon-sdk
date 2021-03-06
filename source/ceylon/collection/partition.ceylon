"Groups the given [[elements]] into two sequences, the first 
 containing elements selected by the given [[predicate 
 function|selecting]], and the second containing elements 
 rejected by the given predicate function."
shared [Element[],Element[]] partition<Element>
        ({Element*} elements, selecting) {
    
    "A predicate function that determines if a specified 
     element should be selected or rejected. Returns `true`
     to indicate that the element is selected, or `false`
     to indicate that the element is rejected."
    Boolean selecting(Element element);
    
    value selected = SequenceBuilder<Element>();
    value rejected = SequenceBuilder<Element>();
    for (element in elements) {
        if (selecting(element)) {
            selected.append(element);
        }
        else {
            rejected.append(element);
        }
    }
    return [selected.sequence, rejected.sequence];
}
