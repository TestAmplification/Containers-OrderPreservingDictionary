# Containers-OrderPreservingDictionary
An implementation of multiple dictionaries preserving the order of addition of elements.


![https://github.com/pharo-containers/Containers-OrderPreservingDictionary/workflows/currentStablePharo/badge.svg](https://github.com/pharo-containers/Containers-OrderPreservingDictionary/workflows/currentStablePharo/badge.svg)
![https://github.com/pharo-containers/Containers-OrderPreservingDictionary/workflows/matrix/badge.svg](https://github.com/pharo-containers/Containers-OrderPreservingDictionary/workflows/matrix/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github//Ducasse/Containers-OrderPreservingDictionary/badge.svg?branch=master)](https://coveralls.io/github//Ducasse/Containers-OrderPreservingDictionary?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()




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
   with: [ spec repository: 'github://Ducasse/Containers-OrderPreservingDictionary/src' ].
```

## History
I harvested the code from the old SmalltalkHub/PharoExtras repository. Interested archeologues can find relevant commit history there. 
http://www.smalltalkhub.com/#!/~PharoExtras/OrderPreservingDictionary
