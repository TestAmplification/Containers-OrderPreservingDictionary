Class {
	#name : #CTOrderPreservingStringDictionaryTest,
	#superclass : #CTStandardOrderedDictionaryTest,
	#category : #'Containers-OrderPreservingDictionary-Tests'
}

{ #category : #accessing }
CTOrderPreservingStringDictionaryTest >> dictionaryClass [
	^ CTOrderPreservingStringDictionary
]

{ #category : #tests }
CTOrderPreservingStringDictionaryTest >> testAssociationAt [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary associationAt: each key) isNil.
	
		dictionary add: each.
		self assert: (dictionary associationAt: each key) = each].
]

{ #category : #tests }
CTOrderPreservingStringDictionaryTest >> testAt [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary at: each key) = ''.

		dictionary add: each.
		self assert: (dictionary at: each key) = each value].
]

{ #category : #tests }
CTOrderPreservingStringDictionaryTest >> testKeyAtIdentityValue [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary keyAtIdentityValue: each value) = ''.

		dictionary add: each.
		self
			assert: (dictionary keyAtIdentityValue: each value) = each key;
			assert: (dictionary keyAtIdentityValue: each value copy) = ''].
]

{ #category : #tests }
CTOrderPreservingStringDictionaryTest >> testKeyAtIndex [
	| dictionary |

	dictionary := self emptyDictionary.
	self assert: (dictionary keyAtIndex: 0) = ''.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary keyAtIndex: i) = ''.

		dictionary add: each.
		self assert: (dictionary keyAtIndex: i) = each key].
]

{ #category : #tests }
CTOrderPreservingStringDictionaryTest >> testKeyAtValue [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary keyAtValue: each value) = ''.

		dictionary add: each.
		self assert: (dictionary keyAtValue: each value) = each key].
]

{ #category : #tests }
CTOrderPreservingStringDictionaryTest >> testRemoveKey [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary removeKey: each key) = each value.
		self
			assertKey: each key
			wasRemovedfrom: dictionary.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations: (self orderedAssociationsAllButFirst: i).

		self assert: (dictionary removeKey: each key) = '']
]
