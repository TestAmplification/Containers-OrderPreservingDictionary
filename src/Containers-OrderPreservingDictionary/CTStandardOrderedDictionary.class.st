"
This class is a dictionary that uses key insertion order when enumerating, printing, or returning collections of keys/values/associations, but not when testing for equality.

Insertion, updating, and inclusion testing have O(1) complexity while removing has O(n) worst-case.

For example, the printing is using the insertion order 

	CTStandardOrderedDictionary orderedDictionaryABC printString 
	>>> 'a CTStandardOrderedDictionary(#A->''A'' #B->''B'' #C->''C'')'
"
Class {
	#name : #CTStandardOrderedDictionary,
	#superclass : #Collection,
	#instVars : [
		'dictionary',
		'orderedKeys'
	],
	#category : #'Containers-OrderPreservingDictionary'
}

{ #category : #'instance creation' }
CTStandardOrderedDictionary class >> new [
	^ self new: 10
]

{ #category : #'instance creation' }
CTStandardOrderedDictionary class >> new: aCapacity [
	^ self basicNew initialize: aCapacity
]

{ #category : #'instance creation' }
CTStandardOrderedDictionary class >> newFrom: anAssociationCollection [

	| newDictionary |
	newDictionary := self new: anAssociationCollection size.
	anAssociationCollection associationsDo: [:each |
		newDictionary
			at: each key
			put: each value].
	^ newDictionary.
]

{ #category : #'instance creation' }
CTStandardOrderedDictionary class >> newFromPairs: aSequenceableCollection [

	| newDictionary |
	newDictionary := self new: (aSequenceableCollection size / 2) floor.
	1 to: aSequenceableCollection size - 1 by: 2 do: [:i |
		newDictionary
			at: (aSequenceableCollection at: i)
			put: (aSequenceableCollection at: i + 1)].
	^ newDictionary.
]

{ #category : #examples }
CTStandardOrderedDictionary class >> orderedDictionaryABA [
	<sampleInstance>
	| dict |
	dict := self new. 
	dict at: #A put: 'A'.
	dict at: #B put: 'B'.
	dict at: #A put: 'A'.
	^ dict
]

{ #category : #examples }
CTStandardOrderedDictionary class >> orderedDictionaryABC [
	<sampleInstance>
	| dict |
	dict := self new. 
	dict at: #A put: 'A'.
	dict at: #B put: 'B'.
	dict at: #C put: 'C'.
	^ dict
]

{ #category : #comparing }
CTStandardOrderedDictionary >> = anObject [
	"Returns true if the receiver and argument are identical, or if they
	are both some kind of order-preserving dictionary and if they have
	the same associations regardless of order."

	self == anObject
		ifTrue: [^ true].

	(anObject isOrderPreservingDictionary
		and: [self isIdentityDictionary = anObject isIdentityDictionary
			and: [self size = anObject size]])
		ifFalse: [^ false].

	dictionary associationsDo: [:each |
		(anObject at: each key ifAbsent: [^ false]) = each value
			ifFalse: [^ false]].
	^ true.
]

{ #category : #adding }
CTStandardOrderedDictionary >> add: anAssociation [
	| oldSize |

	oldSize := dictionary size.
	dictionary add: anAssociation.
	dictionary size > oldSize
		ifTrue: [
			orderedKeys size > oldSize
				ifFalse: [self growOrderedKeys].
			orderedKeys at: oldSize + 1 put: anAssociation key].
	^ anAssociation.
]

{ #category : #adding }
CTStandardOrderedDictionary >> addAll: anAssociationCollection [
	"Since Collection implements #associationsDo:, this method can accept
	any collection of associations including Arrays and OrderedCollections"

	anAssociationCollection associationsDo: [:each | self add: each].
	^ anAssociationCollection.
]

{ #category : #accessing }
CTStandardOrderedDictionary >> associationAt: aKey [
	^ dictionary associationAt: aKey
]

{ #category : #accessing }
CTStandardOrderedDictionary >> associationAt: aKey ifAbsent: aBlock [
	^ dictionary
		associationAt: aKey
		ifAbsent: aBlock
]

{ #category : #accessing }
CTStandardOrderedDictionary >> associationAt: aKey ifPresent: aBlock [

	^ aBlock cull:
		(dictionary
			associationAt: aKey
			ifAbsent: [^ nil])
]

{ #category : #accessing }
CTStandardOrderedDictionary >> associations [

	| associations i |
	associations := Array new: self size.
	i := 1.
	self associationsDo: [:each |
		associations at: i put: each.
		i := i + 1].
	^ associations.
]

{ #category : #enumerating }
CTStandardOrderedDictionary >> associationsDo: aBlock [
	self keysDo: [:each |
		aBlock value: (self associationAt: each)]
]

{ #category : #enumerating }
CTStandardOrderedDictionary >> associationsSelect: aBlock [
	^ self speciesNewFrom: (self associations select: aBlock)
]

{ #category : #accessing }
CTStandardOrderedDictionary >> at: aKey [
	^ dictionary at: aKey
]

{ #category : #accessing }
CTStandardOrderedDictionary >> at: aKey ifAbsent: aBlock [
	^ dictionary
		at: aKey
		ifAbsent: aBlock
]

{ #category : #accessing }
CTStandardOrderedDictionary >> at: aKey ifAbsentPut: aBlock [
	^ self
		at: aKey
		ifAbsent: [
			self
				at: aKey
				put: aBlock value]
]

{ #category : #accessing }
CTStandardOrderedDictionary >> at: aKey ifPresent: aBlock [

	^ aBlock cull:
		(self
			at: aKey
			ifAbsent: [^ nil])
]

{ #category : #accessing }
CTStandardOrderedDictionary >> at: aKey ifPresent: aPresentBlock ifAbsent: anAbsentBlock [

	self
		at: aKey
		ifPresent: [:value | ^ aPresentBlock cull: value].
	^ anAbsentBlock value.
]

{ #category : #accessing }
CTStandardOrderedDictionary >> at: aKey put: aValue [
	
	| oldSize |
	oldSize := dictionary size.
	dictionary
		at: aKey
		put: aValue.
	dictionary size > oldSize
		ifTrue: [
			orderedKeys size > oldSize
				ifFalse: [self growOrderedKeys].
			orderedKeys at: oldSize + 1 put: aKey].
	^ aValue.
]

{ #category : #accessing }
CTStandardOrderedDictionary >> capacity [
	^ dictionary capacity
]

{ #category : #enumerating }
CTStandardOrderedDictionary >> collect: aBlock [
	^ self speciesNewFrom:
		(self associations collect: [:each |
			each key -> (aBlock value: each value)])
]

{ #category : #copying }
CTStandardOrderedDictionary >> copyEmpty [
	"Squeak and GS don't have Collection>>#copyEmpty:, so it is
	reimplemented for portability"
	^ self species new
]

{ #category : #private }
CTStandardOrderedDictionary >> dictionary [
	^ dictionary
]

{ #category : #accessing }
CTStandardOrderedDictionary >> dictionaryClass [
	^ Dictionary
]

{ #category : #enumerating }
CTStandardOrderedDictionary >> do: aBlock [
	self valuesDo: aBlock
]

{ #category : #private }
CTStandardOrderedDictionary >> errorInvalidIndex: anIndex [
	"Squeak and GS do not have SubscriptOutOfBounds, so Error is used
	for portability"
	Error signal: 'Invalid index: ', anIndex printString
]

{ #category : #private }
CTStandardOrderedDictionary >> errorValueNotFound: aValue [
	"Squeak and GS do not have ValueNotFound, so Error is used
	for portability"
	Error signal: 'Value not found'
]

{ #category : #private }
CTStandardOrderedDictionary >> growOrderedKeys [
	orderedKeys :=
		(Array new: ((orderedKeys size * 1.5) asInteger max: 10))
			replaceFrom: 1
			to: orderedKeys size
			with: orderedKeys
			startingAt: 1.
]

{ #category : #comparing }
CTStandardOrderedDictionary >> hash [
	^ dictionary hash
]

{ #category : #accessing }
CTStandardOrderedDictionary >> identityIndexOfKey: aKey [
	^ self
		identityIndexOfKey: aKey
		ifAbsent: [0]
]

{ #category : #accessing }
CTStandardOrderedDictionary >> identityIndexOfKey: aKey ifAbsent: aBlock [
	1 to: self size do: [:i |
		(orderedKeys at: i) == aKey
			ifTrue: [^ i]].
	^ aBlock value.
]

{ #category : #testing }
CTStandardOrderedDictionary >> includes: anObject [
	^ dictionary includes: anObject
]

{ #category : #testing }
CTStandardOrderedDictionary >> includesAssociation: anAssociation [
	"IndentityDictionary>>includesAssociation: works differently on GS
	testing both key and value identity, so it is reimplemented here
	to behave like Pharo/Squeak"
	^ (dictionary
		at: anAssociation key
		ifAbsent: [^ false]) = anAssociation value
]

{ #category : #testing }
CTStandardOrderedDictionary >> includesIdentity: anObject [
	"GS does not have includesIdentity:"
	self valuesDo: [:each |
		each == anObject
			ifTrue: [^ true]].
	^ false.
]

{ #category : #testing }
CTStandardOrderedDictionary >> includesKey: aKey [
	^ dictionary includesKey: aKey
]

{ #category : #accessing }
CTStandardOrderedDictionary >> indexOfKey: aKey [
	^ self
		indexOfKey: aKey
		ifAbsent: [0]
]

{ #category : #accessing }
CTStandardOrderedDictionary >> indexOfKey: aKey ifAbsent: aBlock [
	1 to: self size do: [:i |
		(orderedKeys at: i) = aKey
			ifTrue: [^ i]].
	^ aBlock value.
]

{ #category : #initialization }
CTStandardOrderedDictionary >> initialize: aCapacity [
	dictionary := self dictionaryClass new: aCapacity.
	orderedKeys := Array new: aCapacity.
]

{ #category : #testing }
CTStandardOrderedDictionary >> isDictionary [
	^ true
]

{ #category : #testing }
CTStandardOrderedDictionary >> isEmpty [
	"Squeak's Collection>>#isEmpty is inefficient"
	^ self size = 0
]

{ #category : #testing }
CTStandardOrderedDictionary >> isIdentityDictionary [
	^ false
]

{ #category : #testing }
CTStandardOrderedDictionary >> isOrderPreservingDictionary [
	^ true
]

{ #category : #accessing }
CTStandardOrderedDictionary >> keyAtIdentityValue: aValue [
	^ self
		keyAtIdentityValue: aValue
		ifAbsent: [self errorValueNotFound: aValue]
]

{ #category : #accessing }
CTStandardOrderedDictionary >> keyAtIdentityValue: aValue ifAbsent: aBlock [
	"GS does not have keyAtIdentityValue:ifAbsent:"
	self keysAndValuesDo: [:key :value |
		value == aValue
			ifTrue: [^ key]].
	^ aBlock value.
]

{ #category : #accessing }
CTStandardOrderedDictionary >> keyAtIndex: anIndex [
	^ self
		keyAtIndex: anIndex
		ifAbsent: [self errorInvalidIndex: anIndex]
]

{ #category : #accessing }
CTStandardOrderedDictionary >> keyAtIndex: anIndex ifAbsent: aBlock [
	^ (anIndex > 0 and: [anIndex <= self size])
		ifTrue: [ orderedKeys at: anIndex]
		ifFalse: aBlock
]

{ #category : #accessing }
CTStandardOrderedDictionary >> keyAtValue: aValue [
	^ dictionary keyAtValue: aValue
]

{ #category : #accessing }
CTStandardOrderedDictionary >> keyAtValue: aValue ifAbsent: aBlock [
	^ dictionary
		keyAtValue: aValue
		ifAbsent: aBlock
]

{ #category : #accessing }
CTStandardOrderedDictionary >> keyForIdentity: anObject [
	"reimplemented for portability"
	self keysAndValuesDo: [:key :value |
		value == anObject
			ifTrue: [^ key]].
	^ nil.
]

{ #category : #accessing }
CTStandardOrderedDictionary >> keys [
	^ orderedKeys
		copyFrom: 1
		to: self size
]

{ #category : #enumerating }
CTStandardOrderedDictionary >> keysAndValuesDo: aBlock [
	self keysDo: [:each |
		aBlock
			value: each
			value: (self at: each)]
]

{ #category : #removing }
CTStandardOrderedDictionary >> keysAndValuesRemove: aTwoArgumentBlock [
	| removedAssociations |

	removedAssociations := OrderedCollection new.
	self associationsDo: [:each |
		(aTwoArgumentBlock
			value: each key
			value: each value)
			ifTrue: [removedAssociations add: each]].
	removedAssociations do: [:each | self removeKey: each key].
]

{ #category : #enumerating }
CTStandardOrderedDictionary >> keysDo: aBlock [
	"use to:do: for speed"
	1 to: self size do: [:i |
		aBlock value: (orderedKeys at: i)]
]

{ #category : #accessing }
CTStandardOrderedDictionary >> keysSortedSafely [
	"GS's #keysSortedSafely returns a SortedCollection instead of
	an Array, so this is reimplemented directly for portability, and
	'self keys' is used instead of 'dictionary keys', because GS's
	#keys returns a Set which can't be sorted"
	^ self keys sort
]

{ #category : #private }
CTStandardOrderedDictionary >> orderedKeys [
	^ orderedKeys reject: [ :each | each isNil ]
]

{ #category : #private }
CTStandardOrderedDictionary >> orderedKeysIdentityIndexOf: aKey [
	"GS does not have #identityIndexOf:"
	1 to: orderedKeys size do: [:i |
		(orderedKeys at: i) == aKey
			ifTrue: [^ i]].
	^ 0.
]

{ #category : #private }
CTStandardOrderedDictionary >> orderedKeysIndexOf: aKey [
	^ orderedKeys indexOf: aKey
]

{ #category : #private }
CTStandardOrderedDictionary >> orderedKeysRemove: aRemovedKey [
	| index |

	index := self orderedKeysIndexOf: aRemovedKey.

	"shift every remaining key after to the left by one"
	orderedKeys
		replaceFrom: index
		to: self size
		with: orderedKeys
		startingAt: index + 1.

	"one key was removed and the rest shifted, so nil what was the last
	key slot before removing and shifting"
	orderedKeys
		at: self size + 1
		put: nil.
]

{ #category : #copying }
CTStandardOrderedDictionary >> postCopy [
	orderedKeys := orderedKeys copy.
	dictionary := dictionary copy.
]

{ #category : #printing }
CTStandardOrderedDictionary >> printElementsOn: aStream [
	aStream nextPut: $(.
	self size > 100
		ifTrue: [
			aStream nextPutAll: 'size '.
			self size printOn: aStream]
		ifFalse: [
			self associations withIndexDo: [:each :i |
				aStream
					print: each key;
					nextPutAll: '->';
					print: each value.
				(i < self size)
					ifTrue: [aStream space]]].
	aStream nextPut: $).
]

{ #category : #removing }
CTStandardOrderedDictionary >> remove: anObject ifAbsent: aBlock [
	self shouldNotImplement
]

{ #category : #removing }
CTStandardOrderedDictionary >> removeAll [
	1 to: self size do: [:i |
		orderedKeys
			at: i
			put: nil].
	dictionary removeAll.
]

{ #category : #removing }
CTStandardOrderedDictionary >> removeKey: aKey [
	| value |

	value := dictionary removeKey: aKey.
	self orderedKeysRemove: aKey.
	^ value.
]

{ #category : #removing }
CTStandardOrderedDictionary >> removeKey: aKey ifAbsent: aBlock [
	| oldSize value |

	oldSize := dictionary size.
	value :=
		dictionary
			removeKey: aKey
			ifAbsent: aBlock.
	dictionary size < oldSize
		ifTrue: [self orderedKeysRemove: aKey].
	^ value.
]

{ #category : #removing }
CTStandardOrderedDictionary >> removeKeys: aKeyCollection [
	"Fast removal of multiple keys; returns self to avoid
	having to create a removed value collection and does not
	raise errors."

	aKeyCollection	size > 1
		ifTrue: [| oldSize newOrderedKeys newOrderedKeysIndex |
			oldSize := self size.
			aKeyCollection do: [:each |
				dictionary
					removeKey: each
					ifAbsent: [nil]].

			newOrderedKeys := Array new: oldSize.
			newOrderedKeysIndex := 0.
			1 to: oldSize do: [:i | | key |
				(dictionary includesKey: (key := orderedKeys at: i))
					ifTrue: [
						newOrderedKeys
							at: (newOrderedKeysIndex := newOrderedKeysIndex + 1)
							put: key]].

			orderedKeys := newOrderedKeys]
		ifFalse: [
			aKeyCollection size = 1
				ifTrue: [
					"use #anyOne, because it can be a Set"
					self
						removeKey: aKeyCollection anyOne
						ifAbsent: [nil]]]
]

{ #category : #enumerating }
CTStandardOrderedDictionary >> select: aBlock [
	^ self speciesNewFrom:
		(self associations select: [:each | aBlock value: each value])
]

{ #category : #accessing }
CTStandardOrderedDictionary >> size [
	^ dictionary size
]

{ #category : #private }
CTStandardOrderedDictionary >> speciesNewFrom: anAssociationCollection [
	^ self species newFrom: anAssociationCollection
]

{ #category : #accessing }
CTStandardOrderedDictionary >> values [
	^ self associations collect: [:each | each value]
]

{ #category : #enumerating }
CTStandardOrderedDictionary >> valuesDo: aBlock [
	self keysDo: [:each |
		aBlock value: (self at: each)]
]
