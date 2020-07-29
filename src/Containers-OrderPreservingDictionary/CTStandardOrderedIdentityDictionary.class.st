"
I am an OrderedIdentityDictionary version that uses == instead of = for key comparing. That means I consider two keys to be equal only if they are the same object.

"
Class {
	#name : #CTStandardOrderedIdentityDictionary,
	#superclass : #CTStandardOrderedDictionary,
	#category : #'Containers-OrderPreservingDictionary'
}

{ #category : #accessing }
CTStandardOrderedIdentityDictionary >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #accessing }
CTStandardOrderedIdentityDictionary >> indexOfKey: aKey ifAbsent: aBlock [
	^ self
		identityIndexOfKey: aKey
		ifAbsent: aBlock
]

{ #category : #testing }
CTStandardOrderedIdentityDictionary >> isIdentityDictionary [
	^ true
]

{ #category : #private }
CTStandardOrderedIdentityDictionary >> orderedKeysIndexOf: aKey [
	^ self orderedKeysIdentityIndexOf: aKey
]
