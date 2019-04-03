# Containers-OrderPreservingDictionary
An implementation of multiple dictionaries preserving the order of addition of elements.

## Loading

```
Metacello new
   baseline: 'ContainersOrderPreservingDictionary';
   repository: 'github://Ducasse/Containers-OrderPreservingDictionary';
   load.
```

## If you want to depend on it

```
spec 
   baseline: 'ContainersOrderPreservingDictionary' 
   with: [ spec repository: 'github://Ducasse/Containers-OrderPreservingDictionary' ].
```

## History
I harvested the code from the old SmalltalkHub/PharoExtras repository. Interested archeologues can find relevant commit history there. 
http://www.smalltalkhub.com/#!/~PharoExtras/OrderPreservingDictionary
