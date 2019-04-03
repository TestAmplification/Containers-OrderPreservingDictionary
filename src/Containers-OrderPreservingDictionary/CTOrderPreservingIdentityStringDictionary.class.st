"
An IdentityDictionary version that uses == instead of = for key comparing.
"
Class {
	#name : #CTOrderPreservingIdentityStringDictionary,
	#superclass : #CTOrderPreservingStringDictionary,
	#category : #'Containers-OrderPreservingDictionary'
}

{ #category : #accessing }
CTOrderPreservingIdentityStringDictionary >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #accessing }
CTOrderPreservingIdentityStringDictionary >> indexOfKey: aKey ifAbsent: aBlock [
	^ self
		identityIndexOfKey: aKey
		ifAbsent: aBlock
]

{ #category : #testing }
CTOrderPreservingIdentityStringDictionary >> isIdentityDictionary [
	^ true
]

{ #category : #private }
CTOrderPreservingIdentityStringDictionary >> orderedKeysIndexOf: aKey [
	^ self orderedKeysIdentityIndexOf: aKey
]
