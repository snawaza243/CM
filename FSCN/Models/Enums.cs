namespace FSCN.Models
{
    public static class ProjectStatus
    {
        public const string Pending = "Pending";
        public const string Active = "Active";
        public const string OnHold = "OnHold";
        public const string Completed = "Completed";
        public const string Cancelled = "Cancelled";
    }

    public static class TaskStatus
    {
        public const string NotStarted = "NotStarted";
        public const string InProgress = "InProgress";
        public const string Completed = "Completed";
        public const string Blocked = "Blocked";
    }

    public static class TaskPriority
    {
        public const string Low = "Low";
        public const string Medium = "Medium";
        public const string High = "High";
        public const string Critical = "Critical";
    }

    public static class InvoiceStatus
    {
        public const string Draft = "Draft";
        public const string Sent = "Sent";
        public const string Viewed = "Viewed";
        public const string Paid = "Paid";
        public const string Overdue = "Overdue";
        public const string Cancelled = "Cancelled";
    }

    public static class PaymentMethod
    {
        public const string Check = "Check";
        public const string BankTransfer = "BankTransfer";
        public const string CreditCard = "CreditCard";
        public const string Cash = "Cash";
    }

    public static class ExpenseCategory
    {
        public const string Materials = "Materials";
        public const string Labor = "Labor";
        public const string Equipment = "Equipment";
        public const string Subcontractor = "Subcontractor";
        public const string Transportation = "Transportation";
        public const string Other = "Other";
    }
}