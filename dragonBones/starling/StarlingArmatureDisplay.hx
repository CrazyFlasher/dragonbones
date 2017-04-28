package dragonBones.starling;

import haxe.Constraints;

import dragonBones.Armature;
import dragonBones.animation.Animation;
import dragonBones.core.IArmatureDisplay;
import dragonBones.events.EventObject;

import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.textures.Texture;


/**
 * @inheritDoc
 */
@:allow(dragonBones) @:final class StarlingArmatureDisplay extends Sprite implements IArmatureDisplay<DisplayObject, Texture>
{
	public static var useDefaultStarlingEvent:Bool = false;
	/**
	 * @private
	 */
	private var _armature:Armature<DisplayObject, Texture>;
	/**
	 * @private
	 */
	private function new()
	{
		super();
	}
	/**
	 * @private
	 */
	private function _onClear():Void
	{
		_armature = null;
	}
	/**
	 * @private
	 */
	private function _dispatchEvent(type:String, eventObject:EventObject<DisplayObject, Texture>):Void
	{
		if (useDefaultStarlingEvent)
		{
			dispatchEventWith(type, false, eventObject);
		}
		else
		{
			var event:StarlingEvent = new StarlingEvent(type, eventObject);
			dispatchEvent(event);
		}
	}
	/**
	 * @private
	 */
	private function _debugDraw(isEnabled:Bool):Void
	{
	}
	/**
	 * @inheritDoc
	 */
	override public function dispose():Void
	{
		if (_armature != null)
		{
			_armature.dispose();
			_armature = null;
		}
		
		super.dispose();
	}
	/**
	 * @inheritDoc
	 */
	public function hasEvent(type:String):Bool
	{
		return hasEventListener(type);
	}
	/**
	 * @inheritDoc
	 */
	public function addEvent(type:String, listener:Function):Void
	{
		addEventListener(type, listener);
	}
	/**
	 * @inheritDoc
	 */
	public function removeEvent(type:String, listener:Function):Void
	{
		removeEventListener(type, listener);
	}
	/**
	 * @inheritDoc
	 */
	public var armature(get, never):Armature<DisplayObject, Texture>;
	private function get_armature():Armature<DisplayObject, Texture>
	{
		return _armature;
	}
	/**
	 * @inheritDoc
	 */
	public var animation(get, never):Animation<DisplayObject, Texture>;
	private function get_animation():Animation<DisplayObject, Texture>
	{
		return _armature.animation;
	}
	
	/**
	 * @deprecated
	 */
	public function advanceTimeBySelf(on:Bool):Void
	{
		if (on)
		{
			StarlingFactory._clock.add(_armature);
		} 
		else 
		{
			StarlingFactory._clock.remove(_armature);
		}
	}
}