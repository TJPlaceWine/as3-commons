/*
 * Copyright (c) 2008-2009 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.as3commons.logging.setup.target {
	
	/**
	 * Outputs log statements to the <code>trace()</code> method. 
	 *
	 * @author Christophe Herreman
	 * @author Martin Heidegger
	 * @version 2
	 */
	public const TRACE_TARGET: IFormattingLogTarget = new TraceTarget();
}

import org.as3commons.logging.LogLevel;
import org.as3commons.logging.setup.target.IFormattingLogTarget;
import org.as3commons.logging.util.LogMessageFormatter;

final class TraceTarget implements IFormattingLogTarget {
	
	public static const DEFAULT_FORMAT: String = "{time} {logLevel} - {shortName} - {message}";
	
	private var _formatter:LogMessageFormatter;
	
	public function TraceTarget( format: String = null ) {
		this.format = format;
	}
	
	public function set format( format: String ): void {
		_formatter = new LogMessageFormatter( format || DEFAULT_FORMAT );
	}
	
	public function log(name:String, shortName:String, level:LogLevel, timeStamp:Number, message:*, parameters:Array):void {
		trace( _formatter.format( name, shortName, level, timeStamp, message, parameters));
	}
}