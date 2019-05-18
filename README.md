# Containers-OrderPreservingDictionary
An implementation of multiple dictionaries preserving the order of addition of elements.

[![Build Status](https://travis-ci.com/Ducasse/Containers-OrderPreservingDictionary.svg?branch=master)](https://travis-ci.com/Ducasse/Containers-OrderPreservingDictionary)
[![Coverage Status](https://coveralls.io/repos/github//Ducasse/Containers-OrderPreservingDictionary/badge.svg?branch=master)](https://coveralls.io/github//Ducasse/Containers-OrderPreservingDictionary?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/olekscode/dataframe)  -->



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
