namespace FSCN.Models
{
    public class InvoiceLineItem
    {
        public decimal LineItemId { get; set; }
        public decimal InvoiceId { get; set; }
        public string Description { get; set; }
        public decimal Quantity { get; set; } = 1;
        public decimal UnitPrice { get; set; }
        public decimal LineTotal => Quantity * UnitPrice;

        // Navigation property
        public Invoice Invoice { get; set; }
    }
}