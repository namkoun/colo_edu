package kr.cfms.common.util.common;

public final class NullToDefaultValue {

    public static Integer nullToZero(Integer value) {
        if (value == null)
            return new Integer(0);
        else
            return value;
    }

    public static Integer nullToZero(Object value) {
        if (value == null)
            return new Integer(0);
        else {
            try {
                return nullToZero(Integer.parseInt(value.toString()));
            } catch (Exception e) {
                return new Integer(0);
            }
        }
    }

    public static String nullToEmpty(Object value) {
        if (value != null) {
            return value.toString();
        }
        return "";
    }

    public static Boolean isEmpty(Object value) {
        if (value != null) {
            if ("".equals(value.toString())) {
                return true;
            } else {
                return false;
            }
        }
        return true;
    }
}