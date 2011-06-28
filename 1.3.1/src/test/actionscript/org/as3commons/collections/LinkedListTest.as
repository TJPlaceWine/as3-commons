/**
 * Copyright 2010 The original author or authors.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.as3commons.collections {
	import org.as3commons.collections.framework.ICollection;
	import org.as3commons.collections.framework.ILinkedList;
	import org.as3commons.collections.mocks.LinkedListMock;
	import org.as3commons.collections.testhelpers.AbstractCollectionTestCase;
	import org.as3commons.collections.units.ICollectionTests;
	import org.as3commons.collections.units.IDuplicatesTests;
	import org.as3commons.collections.units.IInsertionOrderDuplicatesTests;

	/**
	 * @author Jens Struwe 25.03.2010
	 */
	public class LinkedListTest extends AbstractCollectionTestCase {

		/*
		 * AbstractCollectionTest
		 */

		override public function createCollection() : ICollection {
			return new LinkedListMock();
		}

		override public function fillCollection(items : Array) : void {
			collection.clear();
			
			for each (var item : * in items) {
				ILinkedList(collection).add(item);
			}
		}

		private function get _linkedList() : ILinkedList {
			return collection as ILinkedList;
		}
		
		/*
		 * Units
		 */

		/*
		 * Collection tests
		 */

		public function test_collection() : void {
			new ICollectionTests(this).runAllTests();
		}

		/*
		 * Duplicates tests
		 */

		public function test_duplicates() : void {
			new IDuplicatesTests(this).runAllTests();
		}

		/*
		 * Order tests
		 */

		public function test_order() : void {
			new IInsertionOrderDuplicatesTests(this).runAllTests();
		}

		/*
		 * ILinkedList
		 */

		/*
		 * Initial state
		 */

		public function test_init() : void {
			assertTrue(_linkedList is ILinkedList);
		}

	}
}
