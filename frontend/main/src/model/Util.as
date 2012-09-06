package model
{
	import flash.display.DisplayObject;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.controls.ComboBox;
	import mx.controls.DataGrid;
	import mx.core.Application;
	import mx.core.UIComponent;
	import mx.formatters.CurrencyFormatter;
	import mx.formatters.DateFormatter;
	import mx.managers.FocusManager;
	import mx.resources.ResourceManager;
	import mx.utils.ObjectUtil;
	import mx.utils.StringUtil;
	

	public class Util
	{
		public function Util()
		{
		}
		
		public static const RESTRICT_ALFABETICO:String = "0-9A-ZÑ .,ÁÉÍÓÚ";
		public static const RESTRICT_CLAVE_ALFANUMERICA:String = "0-9A-Z";
		public static const RESTRICT_CORREO_ELECTRONICO:String = "a-zA-Z.@0-9\\-_~";
		
		public static const currencyFormatter:CurrencyFormatter = new CurrencyFormatter();
		
			/*
		public static function showMessage(message:MessageSACG, callBackFunction:Function = null):void{
			var title:String;
			switch(message.type)
			{
				case MessageSACG.ERROR:
				{
					title = ResourceManager.getInstance().getString("labels","error");
					break;
				}
				default:
				{
					break;
				}
			}
			Alert.show( message.textMessage, title, 4, null, callBackFunction);
		}
			*/
		
		public static function formatStringToDate(value:String):Date{
			if( value == null ){
				return null;
			}
			var date:Date = new Date();
			date.fullYear = Number(value.substr(0,4));
			date.month = Number(value.substr(5,2))-1;
			date.date = Number(value.substr(8,2));
			date.hours = 0;
			date.minutes = 0;
			date.seconds = 0;
			date.milliseconds = 0;
			return date;
		}
		
		public static function formatDateToString(value:Date):String{
			if( value == null ){
				return null;
			}
			var dateFormatter:DateFormatter = new DateFormatter();
			dateFormatter.formatString = "YYYY-MM-DD";
			return dateFormatter.format( value );
		}
		
		public static function selectedIDs(input:Array):Array{
			var values:Array = new Array();
			for each (var i:Object in input) 
			{
				values.push( i["id"] );
			}
			return values.length==0?null:values;
		}
		
		public static function selectedIndexFromCombo(dataProvider:Array, key:Object, property:String="id"):Number
		{
			if( dataProvider == null ){
				return -1;
			}
			var value:Number = -1;
			for(var i:Number = 0; i<dataProvider.length; i++) 
			{
				if( dataProvider[i][property] == key ){
					value = i;
					break;
				}
			}
			return value;
		}
		
		public static function numberToString(number:*):String
		{
			if( number == undefined || number == null || isNaN( number ) ){
				return null;
			}
			return number.toString();
		}
		
		public static function stringToNumber(text:String):*
		{
			if( StringUtil.trim( text ) == "" ){
				return undefined;
			}
			return Number(text);
		}
		
		public static function validateEmpty(text:String):String
		{
			if( text == null ){
				return null;
			}
			var value:String = StringUtil.trim( text );
			if( value == "" ){
				return null;
			}
			return value;
		}
		
		public static function formatDateTimeToString(value:Date):String
		{
			if( value == null ){
				return null;
			}
			var dateFormatter:DateFormatter = new DateFormatter();
			dateFormatter.formatString = "YYYY-MM-DD JJ:NN:SS";
			return dateFormatter.format( value );
		}
		
		public static function addTimeToDate(time:Date, destino:Date):void
		{
			if( time == null ){
				return;
			}
			destino.hours = time.hours;
			destino.minutes = time.minutes;
			destino.seconds = time.seconds;
			destino.milliseconds = time.milliseconds;
		}
		
		public static function formatStringToDateTime(value:String):Date
		{
			if( value == null ){
				return null;
			}
			var date:Date = new Date();
			date.fullYear = Number(value.substr(0,4));
			date.month = Number(value.substr(5,2))-1;
			date.date = Number(value.substr(8,2));
			date.hours = Number(value.substr(11,2));
			date.minutes = Number(value.substr(14,2));
			date.seconds = Number(value.substr(17,2));
			date.milliseconds = 0;
			return date;
		}
		
		public static function compareOnlyDates(date1:Date, date2:Date):Boolean
		{
			if( date1 == null || date2 == null ){
				return false;
			}
			var same:Boolean = true;
			same &&= date1.fullYear == date2.fullYear;
			same &&= date1.month == date2.month;
			same &&= date1.date == date2.date;
			/*
			same &&= date.hours = Number(value.substr(11,2));
			same &&= date.minutes = Number(value.substr(14,2));
			same &&= date.seconds = Number(value.substr(17,2));
			same &&= date.milliseconds = 0;
			*/
			return same;
		}
		
		/**
		 * Compare dates.
		 * Returns 0 if both dates are the same.
		 * Returns -1 if date1 is greater than date2.
		 * Return 1 if date2 is greater than date1.
		 */
		public static function compareDates(date1:Date, date2:Date):Number
		{
			return ObjectUtil.dateCompare(date1, date2);
		}
		
		public static function cleanList(list:DisplayObject):void
		{
			if( list["dataProvider"] != null && list["dataProvider"] is ArrayCollection ){
				(list["dataProvider"] as ArrayCollection).removeAll();
				(list["dataProvider"] as ArrayCollection).refresh();
			}
			list["dataProvider"] = null;
			list["selectedIndex"] = -1;
		}
		
		public static function showMessageVerifyFields():void
		{
			/*
			var message:MessageSACG = new MessageSACG();
			message.type = MessageSACG.ERROR;
			message.textMessage = ResourceManager.getInstance().getString("labels","verifyFields");
			Util.showMessage(message);
			*/
		}
		
		public static function setFocus(component:UIComponent):void
		{
			if( component == null ){
				return;
			}
			var timer:Timer = new Timer(500,1);
			timer.addEventListener(TimerEvent.TIMER,function(e:TimerEvent):void{
				component.setFocus();
			});
			timer.start();
		}
		
		/**
		 * Add an empty Catalog element in the array.
		 */
		public static function addEmptyCatalgo(array:Array):Array{
			/*
			var result:Array = new Array();
			result.push(new Catalogo());
			if( array != null ){
				return result.concat(array);
			}
			return result;
			*/
			return null;
		}
		
		/**
		 * Add an empty Object element in the array, with any property.
		 */
		public static function addEmptyObject(array:Array, property:String):Array{
			var result:Array = new Array();
			var object:Object = new Object();
			object[property] = "";
			result.push( object );
			if( array != null ){
				return result.concat(array);
			}
			return result;
		}
		
		/**
		 * Remueve elementos de un arreglo a partir de otro.
		 */
		public static function removeItemsAt( elementos:ArrayCollection, arreglo:ArrayCollection):void{
			var ordenamientoNumerico:SortField = new SortField();
			ordenamientoNumerico.numeric = true;
			var ordenamiento:Sort = new Sort();
			ordenamiento.fields = [ordenamientoNumerico];
			elementos.sort = ordenamiento;
			elementos.refresh();
			for(var i:Number=arreglo.length-1; i>=0; i--){
				for(var j:Number=elementos.length-1; j>=0; j--){
					if( i == elementos.getItemAt( j ) ){
						arreglo.removeItemAt( i );
					}
				}
			}
		}
		
		/**
		 * Return the amount in currency format.
		 * If amount is undefined, return "";
		 */
		public static function formatCurrency(amount:*):String
		{
			var valueFormatted:String = "";
			if( amount != undefined ){
				valueFormatted = currencyFormatter.format( amount );
			}
			return valueFormatted;
		}
		
		public static function removeItems(dataProvider:Object):void
		{
			if( dataProvider is Array ){
				var length:Number = (dataProvider as Array).length;
				for(var i:int=0; i<length; i++) 
				{
					(dataProvider as Array).pop();
				}
			}
			if( dataProvider is ArrayCollection ){
				(dataProvider as ArrayCollection).removeAll();
			}
		}
		
		/**
		 * Rerturns id or correspondent property.
		 */
		public static function selectedId(comboBox:ComboBox,property:String="id"):*
		{
			if( !comboBoxSelected(comboBox, property) ){
				return undefined;
			}
			return comboBox.selectedItem[property];
		}
		
		/**
		 * Returns if ComboBox has a selected item.
		 */
		public static function comboBoxSelected(comboBox:ComboBox,property:String="id"):Boolean
		{
			if( comboBox == null ||
				comboBox.selectedItem == null ||
				property == null ||
				comboBox.selectedItem[property] == null ||
				comboBox.selectedItem[property] == undefined ||
				isNaN(comboBox.selectedItem[property]) ){
				return false;
			}
			return true;
		}
		
		public static function showErrorMessage(mensaje:String):void
		{
			Alert.show(mensaje, Constants.ERROR);
		}
	}
}