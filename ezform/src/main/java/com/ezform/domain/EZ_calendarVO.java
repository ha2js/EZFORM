package com.ezform.domain;

public class EZ_calendarVO {
		
		private String _id;
		private String title;
		private String start;
		private String end;
		private String description;
		private String type;
		private int userid;
		private String backgroundColor;
		private String textColor;
		private String borderColor;
		private boolean allDay = false;
		
		
		public String get_id() {
			return _id;
		}
		public void set_id(String _id) {
			this._id = _id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getStart() {
			return start;
		}
		public void setStart(String start) {
			this.start = start;
		}
		public String getEnd() {
			return end;
		}
		public void setEnd(String end) {
			this.end = end;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}
		public String getBackgroundColor() {
			return backgroundColor;
		}
		public void setBackgroundColor(String backgroundColor) {
			this.backgroundColor = backgroundColor;
		}
		public String getTextColor() {
			return textColor;
		}
		public void setTextColor(String textColor) {
			this.textColor = textColor;
		}
		public String getBorderColor() {
			return borderColor;
		}
		public void setBorderColor(String borderColor) {
			this.borderColor = borderColor;
		}
		public boolean isAllDay() {
			return allDay;
		}
		public void setAllDay(boolean allDay) {
			this.allDay = allDay;
		}
		@Override
		public String toString() {
			return "EZ_calendarVO [_id=" + _id + ", title=" + title + ", start=" + start + ", end=" + end
					+ ", description=" + description + ", type=" + type + ", userid=" + userid + ", backgroundColor="
					+ backgroundColor + ", textColor=" + textColor + ", borderColor=" + borderColor + ", allDay="
					+ allDay + "]";
		}
		
		
}
