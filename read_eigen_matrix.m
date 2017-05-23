function [ A ] = read_eigen_matrix( file_name )
% Tao Du
% taodu@csail.mit.edu
% May 23, 2017
%
% Read a matrix from a binary file dumped by the following Eigen code:
%
% void WriteMatrixToBinaryFile(const std::string& file_name, const Eigen::MatrixXd& A) {
%   std::ofstream fout(file_name, std::ios::out | std::ios::binary);
%   const int row_num = static_cast<int>(A.rows());
%   const int col_num = static_cast<int>(A.cols());
%   fout.write(reinterpret_cast<const char*>(&row_num), sizeof(int));
%   fout.write(reinterpret_cast<const char*>(&col_num), sizeof(int));
%   fout.write(reinterpret_cast<const char*>(A.data()), row_num * col_num * sizeof(double));
%   fout.close();
% }

file_id = fopen(file_name, 'rb');

% The size of the matrix.
matrix_size = fread(file_id, [2, 1], 'int32');
row_num = matrix_size(1);
col_num = matrix_size(2);

% The matrix itself.
A = fread(file_id, [row_num, col_num], 'float64');

fclose(file_id);

end

