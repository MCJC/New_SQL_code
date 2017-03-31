-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
	CREATE PROCEDURE [dbo].[LongPrint]( @string nvarchar(max) )

--	CREATE PROCEDURE <Procedure_Name, sysname, ProcedureName> 
		-- Add the parameters for the stored procedure here
AS
SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

set @string = rtrim( @string )

declare @cr char(1), @lf char(1)
set @cr = char(13)
set @lf = char(10)

declare @len int, @cr_index int, @lf_index int, @crlf_index int, @has_cr_and_lf bit, @left nvarchar(4000), @reverse nvarchar(4000)
set @len = 4000

while ( len( @string ) > @len )
begin
   set @left = left( @string, @len )
   set @reverse = reverse( @left )
   set @cr_index = @len - charindex( @cr, @reverse ) + 1
   set @lf_index = @len - charindex( @lf, @reverse ) + 1
   set @crlf_index = case when @cr_index < @lf_index then @cr_index else @lf_index end
   set @has_cr_and_lf = case when @cr_index < @len and @lf_index < @len then 1 else 0 end
   print left( @string, @crlf_index - 1 )
   set @string = right( @string, len( @string ) - @crlf_index - @has_cr_and_lf )
END

print @string

/* use this syntax: 
                        EXEC dbo.LongPrint @CODEmain 
   instead of
                        PRINT (@CODEmain)
                                                         */
GO
