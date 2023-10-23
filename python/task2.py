import csv
import os 

def add_csv_files(filename):

  threshold = 20
  with open(filename,'r') as csv_file:      
     reader = csv.reader(csv_file)
     
     next(reader)
     for row in reader:
       
       item_type_directory = os.path.join(os.getcwd(), row[1])
       os.makedirs(item_type_directory,exist_ok=True)
       item_report = os.path.join(item_type_directory,f"{row[1]}_report.csv")
       above_threshold_filename = os.path.join(item_type_directory,'above_threshold.csv')
       below_threshold_filename = os.path.join(item_type_directory,'below_threshold.csv')
       with open(item_report,'a', newline='') as item_report_csv,\
       open(above_threshold_filename, 'a', newline='') as above_threshold_filename_csv,\
       open(below_threshold_filename, 'a', newline='') as below_threshold_filename_csv:
         
          item_report_writer = csv.writer(item_report_csv)
          above_threshold_writer = csv.writer(open(above_threshold_filename, 'a', newline=''))
          below_threshold_writer=csv.writer(below_threshold_filename_csv)
        
         
          item_quantity = int(row[3])
          if(item_quantity < threshold):
           below_threshold_writer.writerow(row)
          else:
           above_threshold_writer.writerow(row)


          item_report_writer.writerow(row)

         
csv_filename = "inventory.csv"
add_csv_files(csv_filename) 


       

       

