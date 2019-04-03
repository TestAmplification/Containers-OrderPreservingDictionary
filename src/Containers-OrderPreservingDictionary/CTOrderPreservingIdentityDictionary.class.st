"
An IdentityDictionary version that uses == instead of = for key comparing.
"
Class {
	#name : #CTOrderPreservingIdentityDictionary,
	#superclass : #CTOrderPreservingDictionary,
	#category : #'Containers-OrderPreservingDictionary'
}

{ #category : #accessing }
CTOrderPreservingIdentityDictionary >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #accessing }
CTOrderPreservingIdentityDictionary >> indexOfKey: aKey ifAbsent: aBlock [
	^ self
		identityIndexOfKey: aKey
		ifAbsent: aBlock
]

{ #category : #testing }
CTOrderPreservingIdentityDictionary >> isIdentityDictionary [
	^ true
]

{ #category : #private }
CTOrderPreservingIdentityDictionary >> orderedKeysIndexOf: aKey [
	^ self orderedKeysIdentityIndexOf: aKey
]
