"A wrapper class that exposes any [[Set]] as
 an immutable set, hiding the underlying `Set`
 implementation from clients, and preventing 
 attempts to narrow to [[MutableSet]]."
by ("Gavin King")
shared class ImmutableSet<out Element>(Set<Element> set)
        satisfies Set<Element>
        given Element satisfies Object {
    
    iterator() => set.iterator();
    
    size => set.size;
    
    contains(Object element) => set.contains(element);
    
    shared actual Set<Element> complement<Other>(Set<Other> set)
            given Other satisfies Object 
            => this.set.complement(set);
    
    shared actual Set<Element|Other> exclusiveUnion<Other>(Set<Other> set)
            given Other satisfies Object 
            => this.set.exclusiveUnion(set);
    
    shared actual Set<Element&Other> intersection<Other>(Set<Other> set)
            given Other satisfies Object 
            => this.set.intersection(set);
    
    shared actual Set<Element|Other> union<Other>(Set<Other> set)
            given Other satisfies Object 
            => this.set.union(set);
    
    superset(Set<Object> set) => this.set.superset(set);
    subset(Set<Object> set) => this.set.subset(set);
    
    equals(Object that) 
            => set.equals(that);
    hash => set.hash;
    
    clone => ImmutableSet(set.clone);
    
}